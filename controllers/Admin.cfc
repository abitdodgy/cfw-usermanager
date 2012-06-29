component
	extends="Controller"
	hint="Base admin controller."
{
	/**
	 * @hint Constructor.
	 */
	public void function init() {
		super.init();
		filters(through="isAuthenticated,isAdmin");
	}

	// --------------------------------------------------
	// Filters

	/*
	 * @hint Ensures user is an admin.
	 */
	private void function isAdmin() {
		if ( ! currentUser.admin ) {
			redirectTo(route="home", message="Unathorized!", messageType="error");	
		}
	}

	// --------------------------------------------------
	// Public

	/**
	 * @hint Renders the index page.
	 */
	public void function index() {}
}