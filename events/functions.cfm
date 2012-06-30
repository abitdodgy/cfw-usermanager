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

	/**
	 * @hint Redirects to a stored location or default location.
	 */
	 public any function redirectBackOr(string controller="users", string action="index") {
	 	 if ( StructKeyExists(session, "returnTo") ) {
			var returnTo = Duplicate(session.returnTo);
			StructDelete(session, "returnTo");
	 	 	redirectTo(argumentCollection = returnTo);
	 	 }
	 	 else {
			redirectTo(argumentCollection = arguments);
	 	 }
	 }

	/**
	 * @hint Stores return path to use for friendly redirects.
	 */
	 public void function storeLocation(required struct parameters) {
	 	 session.returnTo = arguments.parameters;
	 }

</cfscript>