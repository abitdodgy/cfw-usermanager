/*
 * @hint Sessions controller.
 * @todo The dpPasswordReset() could probably do with some imporement. If the token is validateed, it logs the user in and sends him to the update password function.
 * We could probably set a session flag to force the password update form to keep them locked there until they change the password.
 */
component
	extends="Controller"
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		filters(through="verifyParams", only="login");
	}

	// --------------------------------------------------    
    // Filters

	/*
	 * @hint Interceptor requests without valid params.
	 */
	private void function verifyParams() {
		if ( (! StructKeyExists(params, "email") || ! Len(params.email)) || (! StructKeyExists(params, "password") || ! Len(params.password)) ) {
			badLogin();
		}
	}

	// --------------------------------------------------    
    // Public

	/*
	 * @hint Resets logs the user in based on a securty token and redirects them to the edit password form.
	 */
	public void function doPasswordReset() {
		if ( StructKeyExists(params, "token") && Len(params.token) ) {
			local.token = model("token").findOneUnexpired(params.token);

			if ( IsObject(local.token) ) {
				local.user = local.token.user();
				local.user.generateTemporaryPassword();

				if ( local.user.update() ) {
					token.delete();
					connectUser(local.user);
					redirectTo(controller="users", action="edit", params="slug=password");	
				}
			}
		}

		badLogin();
	}

	/*
	 * @hint Renders the login page.
	 */
	public void function index() {
		param name="params.email" type="string" default="";
	}

	/*
	 * @hint Attempts to login a user.
	 */
	public void function login() {
		local.user = model("user").findOneByEmail(value=params.email, include="role");

		if ( ! IsObject(local.user) || ! user.authenticate(params.password) ) {
			badLogin();
		}
		else {
			redirectTo(controller="users", action="index");
		}
	}

	/*
	 * @hint Attempts to log out a user.
	 */
	public void function logout() {
		disconnectUser();
		redirectTo(route="home");
	}

	/*
	 * @hint Renders the password reset page.
	 */
	public void function reset() {
		if ( StructKeyExists(params, "email") ) {
			local.user = model("user").findOneByEmail(params.email);	

			if ( IsObject(local.user) ) {
				user.generateSecurityToken();
	
				sendEmail(
					from="admin@cfwusermanager.com",
					to=local.user.email,
					subject="CFW User Manager Password Assistance",
					template="templates/passwordReset",
					recipientName=local.user.name,
					resetURL="#URLFor(controller="sessions", action="doPasswordReset", onlyPath=false, params="token=#local.user.token.token#")#");
			}

			flashInsert(message="Please check your e-mail for further insturctions. Thank you.");
		}
	}

	// --------------------------------------------------    
    // Private

	/*
	 * @hint Handles bad login attempts.
	 */
	private void function badLogin() {
		param name="params.email" type="string" default="";   
		flashInsert(errorMessage="We could not log you in. Please try that again.");
		renderPage(action="index", params=params.email);			
	}

}