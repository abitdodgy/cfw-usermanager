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
			dump(var=request, abort=true);
			redirectTo(route="signIn");	
		}
	}
	
	/**
	 * @hint Redirects the user away if its logged in.
	 */
	private void function redirectIfLoggedIn() {
		if ( signedIn() ) redirectTo(controller="users", action="index");
	}
}