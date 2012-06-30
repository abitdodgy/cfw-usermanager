component
	extends="Controller"
	hint="Handles user authentication."
{
	/**
	 * @hint Constructor.
	 */
	public void function init() {
		filters(through="redirectIfLoggedIn", except="delete"); 
	}

	// --------------------------------------------------
	// RESTful style actions

	/*
	 * @hint Renders the login page.
	 */
	public void function new() {
	}

	/*
	 * @hint Logs in the user.
	 */
	public void function create() {
		var user = model("user").findOneByEmail(params.email);
		if ( ! IsObject(user) || ! user.authenticate(params.password) ) {
			flashInsert(message="We could not log you in. Please try that again.", messageType="error");
			renderPage(action="new");
		}
		else {
			signIn(user);
			redirectBackOr(controller="users", action="index");
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