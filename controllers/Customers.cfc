component
	extends="Controller"
	hint="The customers controller."
{
	/**
	 * @hint Constructor
	 */
	public void function init() {
		filters(through="restrictAccess", except="new,create", role="customer");
		filters(through="getCustomer", except="new,create");
	}

	// --------------------------------------------------
	// Filters

	/**
	 * @hint Returns the customer object.
	 */
	private void function getCustomer() {
		customer = model("customer").findByKey(getConnectedUserId());
		if ( ! IsObject(customer) ) disconnect();
	}

	// --------------------------------------------------
	// Public

	/**
	 * @hint Renders the index page.
	 */
	public void function index() {}

	/**
	 * @hint Renders the new customer page.
	 */
	public void function new() {
		customer = model("customer").new();
	}

	/**
	 * @hint Creates a new customer.
	 */
	public void function create() {
		customer = model("customer").new(params.customer);
		if ( customer.save() ) {
			var token = user.createEmailToken(user.generateTokenValue(user.email, 2));

			// Todo: Insert sendEmail() method here

			redirectTo(action="index", message="Your account was created successfully.", messageType="success");
		}
		else {
			customer.passwordToBlank();
			flashInsert(message="We could not create your account. Please review the errors and try again.", messageType="error");
			renderPage(action="new");
		}
	}

	/**
	 * @hint Renders the edit customer page.
	 */
	public void function edit() {
		customer.passwordToBlank();
	}

	/**
	 * @hint Updates a customer.
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

	/**
	 * @hint Updates a customer e-mail address.
	 */
	public void function updateEmail() {
		// Require authentication
		if ( ! StructKeyExists(params, "currentPassword") || ! customer.authenticate(params.currentPassword) ) {
			flashInsert(message="The current password provided does not match the one we have on record.", messageType="error");
			renderPage(action="edit");
			return;
		}

		if ( customer.update(email=params.customer.email, emailConfirmation=params.customer.emailConfirmation) ) {
				if ( StructKeyExists(customer, "token") ) {
					// Todo: Email has changed and a token was added via callback; add sendEmail() method here. 	
				}

				redirectTo(action="index", message="<strong>Important:</strong> For your own security, your new e-mail address must be verified before any changes take effect. We sent you a verification e-mail to your new address.", messageType="info");
		}
		else {
			flashInsert(message="We could not update your e-mail address. Please review the errors and try again.", messageType="error");
			renderPage(action="edit");
		}
	}

	/**
	 * @hint Updates a customer's password.
	 */
	public void function updatePassword() {
		// Require authentication
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

	/**
	 * @hint Renders the delete account page.
	 */
	public void function delete() {}

	/**
	 * @hint Deletes a customer account.
	 */
	public void function doDelete() {
		// Require authentication
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