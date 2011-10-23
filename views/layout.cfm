<!DOCTYPE html>
<cfoutput>
<html>
	<head>
		<title>#includeContent("pageTitle")#</title>

		#styleSheetLinkTag("bootstrap.min,default,prettify")#

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js" type="text/javascript"></script>
		#javaScriptIncludeTag("bootstrap-alerts")#
	</head>

	<body>

		<!-- Header -->
		<div class="topbar">
			<div class="fill">
				<div class="container">
					<ul class="nav">
						<li>#linkTo(route="home", class="brand", text="CFW User Manager")#</li>
						<li><a>A ColdFusion on Wheels Demo App</a></li>
					</ul>
					<ul class="nav secondary-nav">
						<li>#linkTo(text="Home", route="home")#</li>
						<cfif isConnected()>
							<li>#linkTo(text="My Profile", controller="users", action="index")#</li>
							<li>#linkTo(text="Logout", controller="sessions", action="logout")#</li>
						<cfelse>
							<li>#linkTo(text="Login", route="sessionsHome")#</li>
							<li>#linkTo(text="Sign Up", controller="users", action="new")#</li>
						</cfif>
					</ul>
				</div>
			</div>
		</div>
		<!-- / Header -->

		#includeContent()#
	</body>
</html>
</cfoutput>