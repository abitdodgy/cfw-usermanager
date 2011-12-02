component
	extends="Controller"
	hint="The password reset controller handles password reset requests."
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		filters(through="redirectIfLoggedIn");
		verifies(only="doReset,update", params="key", paramsTypes="string");
	}

	// --------------------------------------------------
	// Filters

	/*
	 * @hint Redirects the user away if they are already logged in.
	 */
	private void function redirectIfLoggedIn() {
		if ( isConnected() ) redirectAfterLogin();
	}

	// --------------------------------------------------
	// Public

	/*
	 * @hint Renders the reset page.
	 */
	public void function reset() {}

	/*
	 * @hint Generates a password reset token and sends instructions to the user.
	 */
	public void function sendInstructions() {
		if ( ! StructKeyExists(params, "email") || ! IsValid("email", params.email) ) {
			redirectTo(action="reset", message="Please provide a valid email address.", messageType="error");	
		}

		var user = model("user").findOneByEmail(params.email);	

		if ( IsObject(user) ) {
			var token = user.passwordToken();

			if ( ! IsObject(token) ) {
				token = user.createPasswordToken(user.generateTokenValue());	
			}

			// Since email is not setup in the demo app, we will comment this function out. 
			/*
			sendMail(
				to=user.email,
				from="",
				subject="Password reset request",
				template="/templates/passwordReset",
				recipientName=user.name,
				verificationURL=URLFor(action="doReset", onlyPath=false, key=token.value)
			);
			*/
		}

		flashInsert(message="Please check your e-mail for further insturctions.", messageType="info");
		renderPage(action="reset");
	}

	/*
	 * @hint Verifies a password reset request. Redirects to the edit password page if the request is verified, otherwise redirects back to the reset page.
	 */
	public void function doReset() {
		var token = model("tokenPassword").findOneByValue(value=params.key, where="expires > NOW()", include="user");

		if ( IsObject(token) ) {
			user = token.user;
			user.passwordToBlank();
		}
		else {
			redirectTo(action="reset");
		}
	}

	/*
	 * @hint Updates a user password after reset request is confirmed.
	 */
	public void function update() {
		var token = model("tokenPassword").findOneByValue(value=params.key, where="expires > NOW()", include="user");

		if ( IsObject(token) ) {
			if ( token.user.update(password=params.user.password, passwordConfirmation=params.user.passwordConfirmation) ) {
				token.delete();
				redirectAfterLogin();
			}
			else {
				token.user.passwordToBlank();
				flashInsert(message="We could not save your new password. Please fix the following errors and try again.", messageType="error");
				renderPage(action="doReset");
			}
		}
		else {
			redirectTo(action="reset");	
		}
	}

}