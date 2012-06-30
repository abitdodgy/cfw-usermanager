component
	extends="Controller"
	hint="Handles public facing pages of the application."
{	
	// --------------------------------------------------
	// Public

	/*
	 * @hint Renders the index page.
	 */
	public void function index() {
		users = model("user").findAll();
	}

}