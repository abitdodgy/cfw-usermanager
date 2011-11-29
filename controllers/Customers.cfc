component
	extends="Controller"
	hint="The customers controller."
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		filters(through="restrictAccess", except="new,create", userType="customer");
		filters(through="getCustomer", except="new,create");
	}

	// --------------------------------------------------
	// Filters

	/*
	 * @hint Returns the customer object
	 */
	private void function getCustomer() {
		customer = model("customer").findByKey(getConnectedUserId());
		if ( ! IsObject(customer) ) {
			disconnect();
		}
	}

	// --------------------------------------------------
	// Public

	/*
	 * @hint Renders the index page
	 */
	public void function index() {}

	/*
	 * @hint Renders the new customer page
	 */
	public void function new() {
		customer = model("customer").new();
	}

	/*
	 * @hint Creates a new customer
	 */
	public void function create() {
		customer = model("customer").new(params.customer);
		if ( customer.save() ) {
			redirectTo(action="index", message="Your account was created successfully.", messageType="success");
		}
		else {
			customer.passwordToBlank();
			flashInsert(message="We could not create your account. Please review the errors and try again.", messageType="error");
			renderPage(action="new");
		}
	}

	/*
	 * @hint Renders the edit customer page
	 */
	public void function edit() {
		customer.passwordToBlank();
	}

	/*
	 * @hint Updates a customer
	 */
	public void function update() {
		if ( customer.update(name=params.customer.name) ) {
			redirectTo(action="index", message="Your account details were updated successfully.", messageType="success");
		}
		else {
			flashInsert(message="We could not update your account. Please review the errors and try again.", messageType="error");
			renderPage(action="edit");
		}
	}

	/*
	 * @hint Updates a customer's e-mail address.
	 */
	public void function updateEmail() {
		if ( ! StructKeyExists(params, "currentPassword") || ! customer.authenticate(params.currentPassword) ) {
			flashInsert(message="The current password provided does not match the one we have on record.", messageType="error");
			renderPage(action="edit");
			return;
		}

		if ( customer.update(email=params.customer.email, emailConfirmation=params.customer.emailConfirmation) ) {
				/*
				sendEmail(
					from="robot@myapp.com",
					to=customer.emaiToken.pendingValue,
					subject="Verify your new e-mail address",
					template="templates/emailVerification",
					recipientName=customer.name,
					resetURL= URLFor(controller="customers", action="confirmEmail", onlyPath=false, params="token=#customer.emailToken.value#"));
				*/

				redirectTo(
					action="index",
					message="<strong>Important:</strong> For your own security, your new e-mail address must be verified before any changes take effect. We sent you a verification e-mail to your new address.",
					messageType="info");
		}
		else {
			flashInsert(message="We could not update your e-mail address. Please review the errors and try again.", messageType="error");
			renderPage(action="edit");
		}
	}

	/*
	 * @hint Renders the confirmation page/confirms an email.
	 */
	public void function confirmEmail() {
		if ( StructKeyExists(params, "key") ) {
			var token = customer.findOneEmailToken(where="value = '#params.key#' AND expires > NOW()");

			if ( IsObject(token) ) {
				if ( customer.update(email=token.pendingValue, isConfirmed=1, callbacks=false) ) {
					token.delete();
					flashInsert(message="Your e-mail address was verified successfully.", messageType="success");
				}
			}
		}
		redirectTo(action="index");
	}

	/*
	 * @hint Updates a customer's password.
	 */
	public void function updatePassword() {
		if ( ! StructKeyExists(params, "currentPassword") || ! customer.authenticate(params.currentPassword) ) {
			customer.passwordToBlank();
			flashInsert(message="The current password provided does not match the one we have on record.", messageType="error");
			renderPage(action="edit");
			return;
		}

		if ( customer.update(password=params.customer.password, passwordConfirmation=params.customer.passwordConfirmation) ) {
			redirectTo(action="index", message="Your password was updated successfully.", messageType="success");
		}
		else {
			customer.passwordToBlank();
			flashInsert(message="We could not update your password. Please review the errors and try again.", messageType="error");
			renderPage(action="edit");
		}
	}

	/*
	 * @hint Renders the delete account page.
	 */
	public void function delete() {}

	/*
	 * @hint Deletes a customer's account.
	 */
	public void function doDelete() {
		if ( ! StructKeyExists(params, "currentPassword") || ! customer.authenticate(params.currentPassword) ) {
			flashInsert(message="The current password provided does not match the one we have on record.", messageType="error");
			renderPage(action="delete");
			return;
		}

		if ( customer.delete() ) {
			flashInsert(message="Your account was deleted successfully.", messageType="success");
			disconnect();
		}
		else {
			flashInsert(message="We could not delete your account due to an internal error. Please try again.", messageType="error");
			renderPage(action="delete");
		}
	}

}