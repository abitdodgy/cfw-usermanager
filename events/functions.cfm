<cfscript>

	/*
	 * @hint Creates a session for authenticated user objects.
	 */
	public void function connectUser(required any user, numeric forcePasswordChange) {
		session.currentUser = {
			id = arguments.user.id,
			name = arguments.user.name,
			role = arguments.user.role.roleName
		};		
	}

	/*
	 * @hint Destroys current user session.
	 */
	public void function disconnectUser() {
		if ( isUserConnected() ) StructDelete(session, "currentUser");
	}

	/*
	 * @hint Returns the id of the current connected user.
	 */
	public any function getConnectedUserId() {
		return isUserConnected() ? session.currentUser.id : false;
	}

	/*
	 * @hint Returns the current role of the user in session.
	 */
	public any function getConnectedUserRole() {
		return isUserConnected() ? session.currentUser.role : false;
	}

	/*
	 * @hint Returns a boolean of a users connection or authentication status.
	 */
	public boolean function isUserConnected() {
		return StructKeyExists(session, "currentUser") ? true : false;
	}


</cfscript>