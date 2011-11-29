component
	extends="Controller"
	hint="The base admin controller."
{
	/** @hint Constructor */
	public void function init() {
		filters(through="restrictAccess", userType="admin");
	}

	// --------------------------------------------------
	// Public

	/** @hint Renders the index page */
	public void function index() {}

}