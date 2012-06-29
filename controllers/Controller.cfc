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
	private void function isAuthorized(string role) {
		if ( ! signedIn() ) {
			redirectTo(route="signIn");	
		}
		else if ( StructKeyExists(arguments, "role") && currentUser.role != arguments.role) {
			redirectTo(route="home", message="Unauthorized!", messageType="error");
		}
	}
}