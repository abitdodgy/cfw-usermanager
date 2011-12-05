component
	extends="Controller"
	hint="The Verification controller handles e-mail and account verification."
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		filters(through="restrictAccess");
		verifies(only="doVerifyEmail", params="key", paramsTypes="string", handler="intercept");
	}

	// --------------------------------------------------
	// Filters

	/*
	 * @hint Handles any requests to doVerifyEmail() that do not contain a params.key param. 
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
	 * @description When a user account is created, or an e-mail address is updated, we create a verification token and email the user with a verification URL. This URL contains a unique token.
	 * This method will attempt to locate the token. If it's found, we load the user object associated with it, and set its isConfirmed property to 1 (true).
	 * The callbacks=false argument is required to prevent an infinite loop. Otherwise, when updating an e-mail address, the User model will detect the change and automatically generate a token.
	 *
	 * Note that, in order to avoid locking users out of their accounts, we do not update an e-mail address until the new e-mail address has been confirmed.
	 */
	public void function doVerifyEmail() {
		var token = model("tokenEmail").findOnebyValue(value=params.key, where="expires > NOW()", include="user");

		if ( IsObject(token) ) {
			if ( token.user.update(email=token.pendingValue, isConfirmed=1, callbacks=false) ) {
				token.delete();
				redirectAfterLogin(message="Your e-mail address was verified successfully.", messageType="success");
			}
		}
		renderPage(action="verifyEmail");
	}

	/*
	 * @hint Sends a verification e-mail in case the original e-mail was lost.
	 * @description This function is needed for existing and new users.
	 * It prevents a scenario where new users can remain unconfirmed if they lose the confirmation e-mail.
	 * It preserves any pending updates made by existing users to their e-mail addresses. Otherwise they would have to re-enter their changes and generate a new verification token and e-mail. See @doVerifyEmail() for details.
	 *
	 * First we want to see if the user has an existing e-mail token. If not, we create a new one with a 48 hour expiration time. Then we e-mail the user with instructions.
	 */
	public void function sendVerificationEmail() {
		var token = model("tokenEmail").findOneByUserId(value=getConnectedUserId(), where="expires > NOW()", include="user");

		if ( ! IsObject(token) ) {
			var user = model("user").findByKey(getConnectedUserId());
			var token = user.createEmailToken(user.generateTokenValue(user.email, 48));
		}

		// Since email is not setup in the demo app, we will comment this function out. 
		/*
		sendMail(
			to=token.pendingValue,
			from="",
			subject="Please verify your e-mail address",
			template="/templates/emailVerification",
			recipientName=user.name,
			verificationURL=URLFor(action="doVerifyEmail", onlyPath=false, key=token.value)
		);
		*/

		flashInsert(message="Please check your e-mail for further instructions.", messageType="info");
		renderPage(action="verifyEmail");
	}

}