<!DOCTYPE html>
<html><cfoutput>

	<head>
		<title>#includeContent("pageTitle")#</title>

		#styleSheetLinkTag("bootstrap.min,default")#

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js" type="text/javascript"></script>
		#javaScriptIncludeTag("bootstrap-alerts")#

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
						<li>#linkTo(route="home", class="brand", text="User Manager")#</li>
						<li>#linkTo(text="Home", route="home")#</li>
						<li>#linkTo(text="Users", controller="users", action="index")#</li>
						<cfif signedIn() AND currentUser.admin>
							<li>#linkTo(text="Admin", controller="admin", action="index")#</li>
						</cfif>
					</ul>
					<ul class="nav secondary-nav">
						<cfif signedIn()>
							<li><a>#currentUser.name#</a></li>
							<li><a>|</a></li>
							<li>#linkTo(text="Profile", route="profile", key=currentUser.id)#</li>
							<li>#linkTo(text="Sign out", route="signOut")#</li>
						<cfelse>
							<li>#linkTo(text="Sign Up", route="signUp")#</li>
							<li>#linkTo(text="Sign in", route="signIn")#</li>
						</cfif>
					</ul>
				</div>
			</div>
		</div>
	</body>

</cfoutput></html>