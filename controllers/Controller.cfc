component
	extends="Wheels"
{
	// --------------------------------------------------
	// Public

	/** @hint Restricts access to admins only. */
	private void function restrictAccess(required string userType) {
		if ( ! isConnected() ) {
			redirectTo(controller="sessions", action="index");
		}
		else if ( ! getConnectedUser("role") == arguments.userType ) {
			disconnect();
		}
	}

}