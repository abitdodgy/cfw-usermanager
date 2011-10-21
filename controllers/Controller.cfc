/**
 * @hint Base Controller.
 */
component
	extends="Wheels"
{
	// --------------------------------------------------    
    // Private

	/**
	 * @hint Verifies user has access permission.
	 */
	private void function isAuthorized() {
		if ( ! isUserConnected() ) {
			redirectTo(route="sessionsHome");
		}
	}

}