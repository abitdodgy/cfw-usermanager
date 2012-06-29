component
	extends="Admin"
	hint="AdminUsers controller."
{
	/**
	 * @hint Constructor.
	 */
	public void function init() {
		super.init();
	}

	// --------------------------------------------------
	// RESTful

	/**
	 * @hint Renders the index page.
	 */
	public void function index() {
		users = model("user").findAll();
		renderPage(template="/admin/adminUsers/index");
	}
	
	/**
	 * @hint Renders the user page.
	 */
	public void function show() {
		user = model("user").findByKey(params.key);
		renderPage(template="/admin/adminUsers/show");
	}
}