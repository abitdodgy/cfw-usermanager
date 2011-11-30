component
	extends="Controller"
	hint="The password reset controller."
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
	 * @Todo Add the sendEmail() function. Resolve a potential vulnrability: A user can generate an unlimited number of tokens.
	 */
	public void function sendInstructions() {
		if ( ! StructKeyExists(params, "email") || ! IsValid("email", params.email) ) {
			redirectTo(action="reset", message="Please provide a valid email address.", messageType="error");	
		}

		var user = model("user").findOneByEmail(params.email);	
		if ( IsObject(user) ) {
			user.createPasswordToken(user.generateTokenValue(validFor=1));

			// Send email to user.
		}

		flashInsert(message="Please check your e-mail for further insturctions.", messageType="info");
		renderPage(action="reset");
	}

	/*
	 * @hint Validates a password reset and redirects to the edit password page.
	 */
	public void function doReset() {
		var token = model("tokenPassword").findOneUnexpired(params.key);

		if ( IsObject(token) ) {
			user = token.user(include="role");
			user.passwordToBlank();
		}
		else {
			redirectTo(action="reset");
		}
	}

	/*
	 * @hint Updates a user's password after reset.
	 */
	public void function update() {
		var token = model("tokenPassword").findOneUnexpired(params.key);

		if ( IsObject(token) ) {
			user = token.user(include="role");

			if ( user.update(password=params.user.password, passwordConfirmation=params.user.passwordConfirmation) ) {
				token.delete();
				redirectAfterLogin();
			}
			else {
				user.passwordToBlank();
				flashInsert(message="We could not save your new password. Please fix the following errors and try again.", messageType="error");
				renderPage(action="doReset");
			}
		}
		else {
			redirectTo(action="reset");	
		}
	}

}