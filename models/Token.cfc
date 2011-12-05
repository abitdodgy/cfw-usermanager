component
	extends="Model"
	hint="The base token model stores different types of verification tokens."
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		belongsTo("user");
	}

}