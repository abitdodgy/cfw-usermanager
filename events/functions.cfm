<cfscript>

	/*
	 * @hint Creates a session for an authenticated user object.
	 */
	public void function connect(required any user) {
		session.currentUser = {
			id = arguments.user.id,
			name = arguments.user.name,
			role = arguments.user.role.roleName
		};		
	}

	/*
	 * @hint Destroys current user session.
	 */
	public void function disconnect() {
		if ( isConnected() ) StructDelete(session, "currentUser");
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