/*
 * @hint Sessions controller.
 */
component
	extends="Controller"
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		filters(through="verifyLoginParams", only="login");
	}

	// --------------------------------------------------    
    // Filters

	/*
	 * @hint Intercepts requests without valid params.
	 */
	private void function verifyLoginParams() {
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
			var token = model("token").findOneUnexpired(params.token);

			if ( IsObject(token) ) {
				var user = token.user();
				user.generateTemporaryPassword();

				if ( user.update() ) {
					token.delete();
					connect(user);
					redirectTo(
						controller="users",
						action="edit",
						params="slug=password",
						message="<strong>Hi there!</strong> Please updated your password to continue.",
						messageType="info"
					);	
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
		var user = model("user").findOneByEmail(value=params.email, include="role");

		if ( ! IsObject(user) || ! user.authenticate(params.password) ) {
			badLogin();
		}
		else {
			connect(user);
			redirectTo(controller="users", action="index");
		}
	}

	/*
	 * @hint Attempts to log out a user.
	 */
	public void function logout() {
		disconnect();
		redirectTo(route="home");
	}

	/*
	 * @hint Renders the password reset page. If an email address is passed, looks it up and sends an email confirmation email.
	 */
	public void function reset() {
		if ( StructKeyExists(params, "email") ) {
			var user = model("user").findOneByEmail(params.email);	

			if ( IsObject(user) ) {
				user.generateSecurityToken();
	
				sendEmail(
					from="admin@cfwusermanager.com",
					to=user.email,
					subject="CFW User Manager Password Assistance",
					template="templates/passwordReset",
					recipientName=user.name,
					resetURL="#URLFor(controller="sessions", action="doPasswordReset", onlyPath=false, params="token=#user.token.token#")#");
			}

			flashInsert(message="<strong>Great!</strong> Please check your e-mail for further insturctions.", messageType="info");
		}
	}

	// --------------------------------------------------    
    // Private

	/*
	 * @hint Handles bad login attempts.
	 */
	private void function badLogin() {
		param name="params.email" type="string" default="";   
		flashInsert(message="<strong>Oh snap!</strong> We could not log you in. Please try that again.", messageType="error");
		renderPage(action="index", params=params.email);
	}

}