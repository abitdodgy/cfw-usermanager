component
	extends="Wheels"
{
	// --------------------------------------------------
	// Filters

	/*
	 * @hint Restricts access to unauthorized users.
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
	 * @hint Redirects the user after login/logged in users.
	 * @role Determines if user should be redirected to customer or admin dashboard.
	 */
	public void function redirectAfterLogin(string role=getConnectedUser("role")) {
		if ( StructKeyExists(session, "redirectParams") ) {
			var args = StructCopy(session.redirectParams);
			StructDelete(session, "redirectParams");
			redirectTo(argumentCollection=args);
		}
		else {
			switch(arguments.role) {
				case "customer": {
					local.controller = "customers";
					break;				
				}
				case "admin": {
					local.controller = "admin";
					break;				
				}
				default: disconnect();
			}
			redirectTo(controller=local.controller, action="index");			
		}
	}

}