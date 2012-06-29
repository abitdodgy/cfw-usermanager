component
	extends="Controller"
	hint="Base admin controller."
{
	/**
	 * @hint Constructor.
	 */
	public void function init() {
		super.init();
		filters(through="isAuthorized", role="admin");
	}

	// --------------------------------------------------
	// Public

	/**
	 * @hint Renders the index page.
	 */
	public void function index() {}
}