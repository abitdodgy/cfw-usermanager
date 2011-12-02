component
	extends="Controller"
	hint="The sessions controller handles user authentication."
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		filters(through="checkLoginParams", only="login");
	}

	// --------------------------------------------------
	// Filters

	/*
	 * @hint Intercepts any request to authenticate that does not have a valid email address and a password.
	 */
	private void function checkLoginParams() {
		if ( (! StructKeyExists(params, "email") || ! Len(params.email)) || (! StructKeyExists(params, "password") || ! Len(params.password)) ) {
			badLogin();
		}
	}

	// --------------------------------------------------
	// Public

	/*
	 * @hint Renders the index page.
	 */
	public void function index() {}

	/*
	 * @hint Logs-in a user.
	 */
	public void function login() {
		var user = model("user").findOneByEmail(value=params.email, include="role");

		if ( ! IsObject(user) || ! user.authenticate(params.password) ) {
			badLogin();
		}
		else {
			connect(user);
			redirectAfterLogin();
		}
	}

	/*
	 * @hint Logs a user out.
	 */
	public void function logout() {
		disconnect();
	}

	// --------------------------------------------------
	// Private

	/*
	 * @hint Handles bad login attempts.
	 */
	private void function badLogin() {
		flashInsert(message="We could not log you in. Please try that again.", messageType="error");
		renderPage(action="index");
	}

}