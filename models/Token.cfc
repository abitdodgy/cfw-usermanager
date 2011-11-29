component
	displayname="Token"
	extends="Model"
	hint="The base token model."
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		belongsTo("user");
	}

	// --------------------------------------------------
	// Public

	/*
	 * @hint A shortcut for finding unexpired tokens.
	 */
	public any function findOneUnexpired(required string token) {
		return this.findOne(where="value = '#arguments.token#' AND expires > '#DateAdd("d", -1, Now())#'");
	}

}