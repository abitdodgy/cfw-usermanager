component
	extends="Controller"
	hint="The Verification controller handles e-mail and account verification."
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
	 * @description When a user account is created, or an email is updated, we create a verification token and e-mail the user with a verification URL that contains the token.
	 * This method will attempt to locate the token. If it's found, we load the user object associated with it and verified and set it's isConfirmed property to true.
	 * The callbacks=false argument is required. The user model will automatically set isConfirmed to 0, or false, if it detects that the e-mail address changed.
	 * Since we are only confirming the email, we need to disable this callback.
	 */
	public void function doVerifyEmail() {
		var token = model("tokenEmail").findOnebyValue(value=params.key, where="expires > NOW()", include="user");

		if ( IsObject(token) ) {
			if ( token.user.update(email=token.pendingValue, isConfirmed=1, callbacks=false) ) {
				token.delete();
				redirectTo(controller="customers", action="index", message="Your e-mail address was verified successfully.", messageType="success");
			}
			else {
				renderPage(action="verifyEmail");
			}
		}
		renderPage(action="verifyEmail");
	}

	/*
	 * @hint Sends a verification e-mail in case the original e-mail was lost.
	 * @description This function is needed for existing and new users.
	 * 	1. New users: Prevent new users from remaining unconfirmed if they lose the confirmation e-mail.
	 * 	2. Existing users: When a user updates his/her e-mail address, we email him/her to confirm the request. We create a verification token and store the new e-mail address with that token.
	 *     To avoid locking users out of their accounts, we do not actually update anything until the new e-mail has been confirmed.
	 *	   Once the requet is confirmed, we carry out the update.
	 *	   Furthermore, giving users the ability to resend the confirmation e-mail preserves any pending updates to their e-mail address. Otherwise they would have to re-enter their changes again to generate a new verification token/e-mail.
	 *
	 * First we want to see if the user already has an e-mail token. If not, we create a new one with a 48 hour expiration time. Then we e-mail the user with instructions.
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