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
	 	redirectTo(route="home");
	 }

	// --------------------------------------------------
	// User session related functions.

	/*
	 * @hint Creates a session for an authenticated user object.
	 */
	public void function connect(required any user) {
		session.currentUser = {
			id = arguments.user.id,
			name = arguments.user.name,
			role = StructKeyExists(arguments.user, "role") ? arguments.user.role.name : user.role().name
		};
	}

	/*
	 * @hint Destroys current user session.
	 */
	public void function disconnect() {
		if ( isConnected() ) StructDelete(session, "currentUser");
		redirectTo(route="home");
	}

	/*
	 * @hint Returns a named property from the current user session.
	 */
	public any function getConnectedUser(required string property) {
		return isConnected() ? session.currentUser[ arguments.property ] : false;
	}

	/*
	 * @hint Returns the id of the current user in session.
	 */
	public any function getConnectedUserId() {
		return isConnected() ? session.currentUser.id : false;
	}

	/*
	 * @hint Checks if a user is loged in or not.
	 */
	public boolean function isConnected() {
		return StructKeyExists(session, "currentUser");
	}

</cfscript>