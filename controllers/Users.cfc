/*
 * @hint Base User controller.
 */
component
	extends="Controller"
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		filters(through="isAuthorized", only="index,edit,update,delete");
		filters(through="getActiveUser", only="index,edit,update,delete");
		verifies(only="create,update", params="user", handler="errorHandler");
	}

	// --------------------------------------------------    
    // Filters & Verifies

	/*
	 * @hint Handles errors caused by missing params.
	 */
	private void function errorHandler() { 
		redirectTo(action="new");
	}

	/*
	 * @hint Returns the current active user object in order to edit, update, or delete it.
	 */
	private void function getActiveUser() { 
		user = model("user").findByKey(getConnectedUserId());

		if ( ! IsObject(user) ) {
			return errorHandler();
		}
	}

	// --------------------------------------------------    
    // Public

	/*
	 * @hint Renders the index page for the user section.
	 */
	public void function index() {
	}

	/*
	 * @hint Renders the signup page for the user section.
	 */
	public void function new() {
		user = model("user").new();
	}

	/*
	 * @hint Creates a new user object.
	 */
	public void function create() {
		user = model("user").new(params.user);
		user.save();

		if ( user.hasErrors() ) {
			renderPage(action="new");
		}
		else {
			redirectTo(action="index");
		}
	}

	/*
	 * @hint Renders the edit user page.
	 */
	public void function edit() {
	}

	/*
	 * @hint Updates a user object.
	 */
	public void function update() {
		if ( ! user.update(params.user) ) {
			renderPage(action="edit");
		}
		else {
			redirectTo(action="index");
		}
	}

	/*
	 * @hint Deletes a user object.
	 */
	public void function delete() {
		if ( ! user.delete() ) {
			redirectTo(action="index", errorMessage="Sorry, but we could not delete your profile. Please try again.");
		}
		else {
			disconnectUser();
			redirectTo(route="home");
		}
	}

}