<cfscript>

	// --------------------------------------------------
	// New user session related functions

	/**
	 * @hint Returns the user currently logged in.
	 */
	 public any function currentUser() {
	 	if ( signedIn() ) {
	 		currentUser = model("user").findByKey(session.currentUser.id);
	 		return currentUser;
	 	}
	 }

	/**
	 * @hint Is the user signed in?
	 */
	 public boolean function signedIn() {
	 	return StructKeyExists(session, "currentUser"); 
	 }

	/**
	 * @hint Signs in the user.
	 */
	 public void function signIn(required user) {
	 	session.currentUser = {
	 		id = arguments.user.id
	 	};
	 }

	/**
	 * @hint Signs the user out.
	 */
	 public void function signOut() {
	 	if ( signedIn() ) {
	 		StructDelete(session, "currentUser");
	 	}
	 }

</cfscript>