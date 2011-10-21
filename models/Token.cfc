/**
 * @hint Token model. Stores password reset tokens.
 */
component
	extends="Model"
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
		return this.findOne(where="token = '#arguments.token#' AND expires > '#DateAdd("d", -1, Now())#'");
	}

}