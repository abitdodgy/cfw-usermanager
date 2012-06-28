component
	extends="Controller"
	hint="Handles user authentication."
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		filters(through="checkLoginParams", only="login");
	}

	// --------------------------------------------------
	// Filters

	/*
	 * @hint Intercepts any request to authenticate that does not have a valid email address and a password.
	 */
	private void function checkLoginParams() {
		if ( (! StructKeyExists(params, "email") || ! Len(params.email)) || (! StructKeyExists(params, "password") || ! Len(params.password)) ) {
			badLogin();
		}
	}

	// --------------------------------------------------
	// REST

	/*
	 * @hint Renders the login page.
	 */
	public void function new() {
	}

	/*
	 * @hint Logs in the user.
	 */
	public void function create() {
		var user = model("user").findOneByEmail(value=params.email, include="role");
		if ( ! IsObject(user) || ! user.authenticate(params.password) ) {
			flashInsert(message="We could not log you in. Please try that again.", messageType="error");
			renderPage(action="new");
		}
		else {
			signIn(user);
			redirectTo(route="home");
		}
	}

	/*
	 * @hint Logs out the user.
	 */
	public void function delete() {
		signOut();
		redirectTo(route="home");
	}
}