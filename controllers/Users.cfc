component
	extends="Controller"
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		super.init();
		filters(through="isAuthorized,isCurrentUser", only="edit,update,delete");
	}

	// --------------------------------------------------
	// Filters

	/*
	 * @hint Ensures it's the correct user.
	 */
	private void function isCurrentUser() {
		user = model("user").findByKey(params.key);
		if ( ! IsObject(user) || ! user.id == currentUser.id ) {
			redirectTo(route="home");
		}
	}

	// --------------------------------------------------
	// RESTful style actions

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