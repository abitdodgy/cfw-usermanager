component
	extends="Controller"
	hint="Handles password reset requests."
{
	/**
	 * @hint Constructor.
	 */
	public void function init() {
		filters(through="redirectIfLoggedIn"); 
	}

	// --------------------------------------------------
	// RESTful Actions

	/**
	 * @hint Renders the reset form page.
	 */
	public void function new() {}

	/**
	 * @hint Creates a new reset token and sends a reset email.
	 */
	public void function create() {
		user = model("user").findOneByEmail(params.email);
		if ( isObject(user) ) {
			user.createPasswordResetToken();
			//sendMail(to=user.email, subject="Password reset", template="/templates/passwordReset", user=user);
		}
		flashInsert(message="We've sent you an email with password reset instructions!", messageType="success");
		renderPage(action="new");
	}
	
	/**
	 * @hint Renders the edit user page where users enter a new passwords.
	 */
	public void function edit() {
		user = model("user").findOneByPasswordResetToken(params.key);
		if ( isObject(user) ) {
			if ( DateDiff("h", user.passwordResetAt, Now()) > 2 ) {
				redirectTo(action="new", message="Password reset has expired.", messageType="warning");	
			}
			else {
				user.passwordToBlank();
			}
		}
	}
	
	/**
	 * @hint Updates the user's password.
	 */
	public void function update() {
		user = model("user").findOneByPasswordResetToken(params.key);
		if ( isObject(user) && user.update(params.user) ) {
			signin(user);
			redirectTo(controller="users", action="show", key=user.id, message="Password reset successfully.", messageType="success");
		}
	}
}