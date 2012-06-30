<cfscript>

	addRoute(name="profile", pattern="/profile/[key]", controller="users", action="show");
	addRoute(name="signOut", pattern="/signout", controller="sessions", action="delete");
	addRoute(name="signIn", pattern="/signin", controller="sessions", action="new");
	addRoute(name="signUp", pattern="/signup", controller="users", action="new");

	addRoute(name="home", pattern="", controller="pages", action="index");

</cfscript>