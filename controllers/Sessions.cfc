component
	DisplayName="Sessions"
	extends="Controller"
	hint="The sessions controller."
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		filters(through="checkLoginParams", only="login");
	}

	// --------------------------------------------------
	// Filters

	/*
	 * @hint Intercepts requests without valid params.
	 */
	private void function checkLoginParams() {
		if ( (! StructKeyExists(params, "email") || ! Len(params.email)) || (! StructKeyExists(params, "password") || ! Len(params.password)) ) {
			badLogin();
		}
	}

	// --------------------------------------------------
	// Public

	/*
	 * @hint Renders the index page
	 */
	public void function index() {}

	/*
	 * @hint Logs-in a user
	 */
	public void function login() {
		var user = model("user").findOneByEmail(value=params.email, include="role");

		if ( ! IsObject(user) || ! user.authenticate(params.password) ) {
			badLogin();
		}
		else {
			connect(user);
			redirect(user);
		}
	}

	/*
	 * @hint Logs-out a user
	 */
	public void function logout() {
		disconnect();
	}

	/*
	 * @hint Renders the password reset page.
	 */
	public void function reset() {
		if ( StructKeyExists(params, "email") ) {
			var user = model("user").findOneByEmail(params.email);	

			if ( IsObject(user) ) {
				user.generatePasswordToken();

				/*
				sendEmail(
					from="password@myapp.com",
					to=user.email,
					subject="CFW User Manager Password Assistance",
					template="templates/passwordReset",
					recipientName=user.name,
					resetURL= URLFor(controller="sessions", action="doReset", onlyPath=false, params="token=#user.passwordToken.value#"));
				*/
			}

			flashInsert(message="Please check your e-mail for further insturctions.", messageType="info");
		}
	}

	/*
	 * @hint Attempts to reset a user's password.
	 */
	public void function doReset() {
		if ( StructKeyExists(params, "key") ) {
			var token = model("tokenPassword").findOneUnexpired(params.key);

			if ( IsObject(token) ) {
				var user = token.user(include="role");
				user.generateTemporaryPassword();

				var temporaryPassword = user.password;

				if ( user.update() ) {
					token.delete();
					connect(user);
					flashInsert(message="Please updated your password to continue. Your temporary password is #temporaryPassword#", messageType="info");
					redirect(user, "edit", "slug=password");
				}
			}
		}

		badLogin();
	}

	// --------------------------------------------------
	// Private

	/*
	 * @hint Handles bad login attempts.
	 */
	private void function badLogin() {
		flashInsert(message="We could not log you in. Please try that again.", messageType="error");
		renderPage(action="index");
	}

	/*
	 * @hint Redirects the user to the appropriate area after login.
	 */    
	private void function redirect(required any user, string action="index", string params="") {
		if ( StructKeyExists(session, "redirectParams") ) {
			var args = StructCopy(session.redirectParams);
			StructDelete(session, "redirectParams");
		}
		else {
			var args = {
				action = arguments.action,
				params = arguments.params				
			};

			switch(arguments.user.role.name) {
				case "Customer": {
					args.controller = "customers";
					break;
				}
				case "Admin": {
					args.controller = "admin";
					break;
				}
				default: {
					disconnect();
					redirectTo(route="home");			
				}
			}
		}

		redirectTo(argumentCollection=args);
	}

}