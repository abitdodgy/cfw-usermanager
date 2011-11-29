<!DOCTYPE html>
<html><cfoutput>

	<head>
		<title>#includeContent("pageTitle")#</title>

		#styleSheetLinkTag("bootstrap.min,default")#
		#javaScriptIncludeTag("bootstrap-alerts")#

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js" type="text/javascript"></script>
		<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>

	<body>
		#includeContent()#

		<!-- Dock -->
		<div class="topbar">
			<div class="fill">
				<div class="container">
					<ul class="nav">
						<li>#linkTo(route="home", class="brand", text="CFW User Manager")#</li>
						<li><a>A ColdFusion on Wheels Demo App</a></li>
					</ul>
					<ul class="nav secondary-nav">
						<cfif isConnected()>
							<li><a>Welcome, #session.currentUser.name#</a></li>
							<li><a>|</a></li>
							<cfif getConnectedUser("role") EQ "admin">
								<li>#linkTo(text="Dashboard", controller="admin", action="index")#</li>
							<cfelseif getConnectedUser("role") EQ "customer">
								<li>#linkTo(text="Dashboard", controller="customers", action="index")#</li>
							</cfif>
							<li><a>|</a></li>
							<li>#linkTo(text="Sign out", controller="sessions", action="logout")#</li>
						<cfelse>
							<li>#linkTo(text="Sign Up", controller="customers", action="new")#</li>
							<li>#linkTo(text="Sign in", controller="sessions", action="index")#</li>
						</cfif>
					</ul>
				</div>
			</div>
		</div>
	</body>

</cfoutput></html>