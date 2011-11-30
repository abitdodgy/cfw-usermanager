<cfscript>

	// --------------------------------------------------
	// User session related functions.

	/*
	 * @hint Creates a session for an authenticated user object.
	 */
	public void function connect(required any user) {
		session.currentUser = {
			id = arguments.user.id,
			name = arguments.user.name,
			role = arguments.user.role.name
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
		return session.currentUser[ arguments.property ];
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