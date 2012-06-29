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
	}
	
	/**
	 * @hint Renders the user page.
	 */
	public void function show() {
		user = model("user").findByKey(params.key);
	}

	/**
	 * @hint Renders the user page.
	 */
	public void function delete() {
		user = model("user").findByKey(params.key);
		user.delete();
		redirectTo(action="index", message="#user.name# was deleted successfully.", messageType="success");
	}

	// --------------------------------------------------
	// Non RESTful actions

	/**
	 * @hint Deletes users marked for deletion using a checkbox.
	 */
	public void function deleteByCheckBox() {
		if ( StructKeyExists(params, "delete") ) {
			model("user").deleteAll(where="id IN(#params.delete#)");
			flashInsert(message="The selected users were deleted successfully.", messageType="success");	
		}
		redirectTo(action="index");
	}

	// --------------------------------------------------
	// Private

	/*
	 * @hint Override the renderPage() method.
	 * This means we don't have to call a custom renderPage() with a named template in each action.
	 * Remember the adminusers folder is nested inside the admin folder.
	 */
	private void function renderPage() {
		super.renderPage(template="/admin/#params.controller#/#params.action#", argumentCollection=arguments);
	}
}