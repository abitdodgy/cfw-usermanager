<cfscript>

	addRoute(name="sessionsHome", pattern="/secure", controller="sessions", action="index");

	addRoute(name="home", pattern="", controller="main", action="index");

</cfscript>