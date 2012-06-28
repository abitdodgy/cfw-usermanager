component
	extends="Wheels"
{
	// --------------------------------------------------
	// Filters

	/*
	 * @hint Restricts access to unauthorized users.
	 * @description The user's original destination is kept in the session so that he/she can be redirected there after login.
	 * @role Restrict access if current user role does not match this argument.
	 */
	private void function restrictAccess(string role) {
		if ( ! isConnected() ) {
			session.redirectParams = params;
			redirectTo(controller="sessions", action="index");
		}
		else if ( StructKeyExists(arguments, "role") ) {
			if ( ! arguments.role == getConnectedUser("role") ) disconnect();	
		}
	}

	// --------------------------------------------------
	// Misc

	/*
	 * @hint Redirects the user after login/logged in users. If redirect params exist in the session, those are used instead.
	 * @role Determines if user should be redirected to customer or admin dashboard.
	 * @action The controller action to redirect to; set to index for convenience.
	 */
	public void function redirectAfterLogin(string role=getConnectedUser("role"), string action="index") {
		if ( StructKeyExists(session, "redirectParams") ) {
			var args = StructCopy(session.redirectParams);
			StructDelete(session, "redirectParams");
			redirectTo(argumentCollection=args);
		}
		else {
			switch(arguments.role) {
				case "customer": {
					arguments.controller = "customers";
					break;				
				}
				case "admin": {
					arguments.controller = "admin";
					break;				
				}
				default: disconnect();
			}
			redirectTo(argumentCollection=arguments);			
		}
	}

}