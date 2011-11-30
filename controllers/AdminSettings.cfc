component
	extends="Admin"
	hint="The admin settings section."
{
	/** @hint Constructor */
	public void function init() {
		super.init();
		filters(through="getAdmin");
	}

	// --------------------------------------------------
	// Filters

	/** @hint Returns the admin object. */
	private void function getAdmin() {
		admin = model("admin").findByKey(getConnectedUserId());
		if ( ! IsObject(admin) ) {
			disconnect();
		}
	}

	// --------------------------------------------------
	// Public

	/** @hint Renders the edit admin page. */
	public void function edit() {
		admin.passwordToBlank();
		renderPage(template="/admin/adminSettings/edit");
	}

	/** @hint Updates the admin details. */
	public void function update() {
		if ( admin.update(name=params.admin.name) ) {
			redirectTo(
				controller="admin",
				action="index",
				message="Your account details were updated successfully.",
				messageType="success");
		}
		else {
			flashInsert(message="We could not update your account. Please review the errors and try again.", messageType="error");
			renderPage(template="/admin/adminSettings/edit");
		}
	}

	/** @hint Updates the admin's email. */
	public void function updateEmail() {
		// Require authentication
		if ( ! StructKeyExists(params, "currentPassword") || ! admin.authenticate(params.currentPassword) ) {
			flashInsert(message="The current password provided does not match the one we have on record.", messageType="error");
			renderPage(template="/admin/adminSettings/edit");
			return;
		}

		if ( admin.update(email=params.admin.email, emailConfirmation=params.admin.emailConfirmation) ) {
				/*
				sendEmail(
					from="robot@myapp.com",
					to=admin.emaiToken.pendingValue,
					subject="Verify your new e-mail address",
					template="templates/emailVerification",
					recipientName=admin.name,
					resetURL= URLFor(controller="admins", action="confirmEmail", onlyPath=false, params="token=#admin.emailToken.value#"));
				*/
				redirectTo(
					controller="admin",
					action="index",
					message="<strong>Important:</strong> For your own security, your new e-mail address must be verified before any changes take effect. We sent you a verification e-mail to your new address.",
					messageType="info");
		}
		else {
			flashInsert(message="We could not update your e-mail address. Please review the errors and try again.", messageType="error");
			renderPage(template="/admin/adminSettings/edit");
		}
	}

	/** @hint Confirms an email. */
	public void function confirmEmail() {
		if ( StructKeyExists(params, "key") ) {
			var token = admin.findOneEmailToken(where="value = '#params.key#' AND expires > NOW()");

			if ( IsObject(token) ) {
				if ( admin.update(email=token.pendingValue, isConfirmed=1, callbacks=false) ) {
					token.delete();
					flashInsert(message="Your e-mail address was verified successfully.", messageType="success");
				}
			}
		}
		redirectTo(controller="admin", action="index");
	}


	/** @hint Updates the admin's password. */
	public void function updatePassword() {
		// Require authentication
		if ( ! StructKeyExists(params, "currentPassword") || ! admin.authenticate(params.currentPassword) ) {
			admin.passwordToBlank();
			flashInsert(message="The current password provided does not match the one we have on record.", messageType="error");
			renderPage(template="/admin/adminSettings/edit");
			return;
		}

		if ( admin.update(password=params.admin.password, passwordConfirmation=params.admin.passwordConfirmation) ) {
			redirectTo(controller="admin", action="index", message="Your password was updated successfully.", messageType="success");
		}
		else {
			admin.passwordToBlank();
			flashInsert(message="We could not update your password. Please review the errors and try again.", messageType="error");
			renderPage(template="/admin/adminSettings/edit");
		}
	}

}