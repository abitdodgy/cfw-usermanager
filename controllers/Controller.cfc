component
	extends="Wheels"
{
	/**
	 * @hint Constructor
	 */
	public void function init() {
		filters(through="getCurrentUser");
	}

	// --------------------------------------------------
	// Filters

	/**
	 * @hint Loads the current user in session.
	 */
	private void function getCurrentUser() {
		if ( signedIn() ) {
			currentUser = currentUser();
		}
	}

	/*
	 * @hint Ensures user is authenticated.
	 */
	private void function isAuthenticated() {
		if ( ! signedIn() ) {
			storeLocation(params);
			redirectTo(route="signIn");	
		}
	}

	/*
	 * @hint Ensures it's the correct user.
	 */
	private void function isAuthorized() {
		user = model("user").findByKey(params.key);
		if ( ! IsObject(user) || ! user.id == currentUser.id ) {
			redirectTo(route="home");
		}
	}

	/**
	 * @hint Redirects the user away if its logged in.
	 */
	private void function redirectIfLoggedIn() {
		if ( signedIn() ) redirectTo(controller="users", action="index");
	}
}