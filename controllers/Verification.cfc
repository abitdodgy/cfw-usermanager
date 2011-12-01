component
	extends="Controller"
	hint="Handles e-mail and account verification."
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		filters(through="restrictAccess", role="customer");
		verifies(only="doVerifyEmail", params="key", paramsTypes="string", handler="intercept");
	}

	// --------------------------------------------------
	// Filters

	/*
	 * @hint Intercepts bad requests.
	 */
	private void function intercept() {
		abort;
	}

	// --------------------------------------------------
	// Public

	/*
	 * @hint Renders the verify e-mail page.
	 */
	public void function verifyEmail() {}

	/*
	 * @hint Verifies a user e-mail.
	 */
	public void function doVerifyEmail() {
		var token = model("tokenEmail").findOneUnexpired(params.key);

		if ( IsObject(token) ) {
			user = token.user();

			if ( ! user.isConfirmed ) {
				if ( user.update(isConfirmed=1) ) {
					user.deleteAllEmailTokens();
					redirectTo(controller="customers", action="index", message="Your e-mail address was verified successfully.", messageType="success");
				}
				else {
					renderPage(action="verifyEmail");
				}
			}
			else {
				user.deleteAllEmailTokens();
				redirectTo(controller="customers", action="index", message="Your e-mail address was verified successfully.", messageType="success");
			}
		}
		renderPage(action="verifyEmail");
	}

	/*
	 * @hint Send verification e-mail in case the original email was lost.
	 * @Todo Potential vulnrability: User could keep generating DB tokens.
	 */
	public void function sendVerificationEmail() {
		var user = model("user").findByKey(getConnectedUserId());

		if ( IsObject(user) ) {
			var token = user.createEmailToken(user.generateTokenValue(user.email, 2));
		}

		// Insert sendEmail() method here.

		flashInsert(message="Please check your e-mail for further instructions.", messageType="info");
		renderPage(action="verifyEmail");
	}

}