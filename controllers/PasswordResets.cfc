component extends="Controller" {

	// Constructor

	 public void function init() {
	 	filters(through="redirectIfLoggedIn"); 
	 }

	// Filters

	private void function redirectIfLoggedIn() {
		if ( signedIn() ) {
			redirectTo(route="home");
		}
	}

	// REST Actions

	public void function new() {
	}

	public void function create() {
		user = model("user").findOneByEmail(params.email);
		if ( isObject(user) ) {
			user.createPasswordResetToken();
			dump(var=URLFor(action="edit", onlyPath=false, key=user.passwordResetToken), abort=true);
			//sendMail(to=user.email, subject="Password reset", template="/templates/passwordReset", user=user);
		}
		flashInsert(message="We've sent you an email with password reset instructions!", messageType="success");
		renderPage(action="new");
	}
	
	public void function edit() {
		user = model("user").findOneByPasswordResetToken(params.key);
		if ( isObject(user) ) {
			if ( DateDiff("h", user.passwordResetAt, Now()) > 2 ) {
				redirectTo(action="new", message="Password reset has expired.", messageType="warning");	
			}
			else {
				user.passwordToBlank();
			}
		}
	}
	
	public void function update() {
		user = model("user").findOneByPasswordResetToken(params.key);
		if ( isObject(user) && user.update(params.user) ) {
			signin(user);
			redirectTo(controller="users", action="show", key=user.id, message="Password reset successfully.", messageType="success");
		}
	}
}