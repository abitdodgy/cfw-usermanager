component
	extends="Controller"
	hint="Handles email confirmation requests."
{
	/**
	 * @hint Constructor.
	 */
	public void function init() {
		super.init();
		filters(through="isAuthenticated,isAuthorized,redirectIfConfirmed", except="update");
	}

	// --------------------------------------------------
	// Filters

	/**
	 * @hint Redirect the user if their email is already confirmed.
	 */
	public void function redirectIfConfirmed() {
		if ( user.confirmed ) {
			redirectTo(route="profile", key=user.id, message="Your email address was previously confirmed.", messageType="warning");
		}
	}

	// --------------------------------------------------
	// RESTful Actions

	/**
	 * @hint Renders a page where users request an email with instructions to confirm their email address.
	 */
	public void function new() {}

	/**
	 * @hint Sends an email with instructions to confirm email address.
	 */
	public void function create() {
		user.update(emailConfirmationToken = user.generateToken());
		//sendMail(to=user.email, subject="Email confirmation", template="/templates/emailConfirmation", user=user);
		redirectTo(route="profile", key=user.id, message="Email sent! Please see email for instructions.", messageType="success");
	}

	/**
	 * @hint Updates the user to confirmed status.
	 */
	public void function update() {
		user = model("user").findOneByEmailConfirmationToken(params.key);
		if ( isObject(user) && user.update(confirmed = 1, emailConfirmationToken = "") ) {
			redirectTo(controller="users", action="show", key=user.id, message="Account confirmed successfully.", messageType="success");
		}
		else {
			redirectTo(route="home", message="No such user.", messageType="error");
		}
	}
}