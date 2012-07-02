component
	extends="Controller"
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		super.init();
		filters(through="isAuthenticated,isAuthorized", only="edit,update,delete");
		filters(through="protectFromMassAssignment", ony="create,update");
	}

	// --------------------------------------------------
	// Filters

	/*
	 * @hint Ensures the admin setting is set to 0 in case a user tries to exploit mass assignment.
	 */
	private void function protectFromMassAssignment() {
		if ( StructKeyExists(params, "user") ) {
			params.user.admin = 0;
		}
	}

	// --------------------------------------------------
	// RESTful style actions

	/**
	 * @hint Renders the user list.
	 */
	public void function index() {
		users = model("user").findAll();
	}

	/*
	 * @hint Renders the profile page.
	 */	
	public void function show() {
		user = model("user").findByKey(params.key);
	}

	/*
	 * @hint Renders the registration form.
	 */
	public void function new() {
		user = model("user").new();	
	}

	/*
	 * @hint Creates a new user.
	 */
	public void function create() {
		user = model("user").new(params.user);
		if ( user.save() ) {
			signIn(user);
			//sendMail(to=user.email, subject="Email confirmation", template="/templates/emailConfirmation", user=user);
			redirectTo(route="profile", key=user.id, message="Account created successfully.", messageType="success");
		}
		else {
			user.passwordToBlank();
			flashInsert(message="Your account could not be created.", messageType="error");
			renderPage(action="new");
		}
	}

	/*
	 * @hint Renders the edit user page.
	 */
	public void function edit() {
		user.passwordToBlank();
	}

	/*
	 * @hint Updates the user.
	 */
	public void function update() {
		if (  user.update(params.user) ) {
			redirectTo(route="profile", key=user.id, message="Profile updated successfully.", messageType="success");
		}
		else {
			user.passwordToBlank();
			flashInsert(message="We could not update your profile.", messageType="error");
			renderPage(action="edit");
		}
	}

	/*
	 * @hint Deletes the user.
	 */
	public void function delete() {
		user.delete();
		signOut();
		redirectTo(route="home", message="Account delete successfully.", messageType="success");
	}
}