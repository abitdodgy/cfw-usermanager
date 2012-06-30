<cfparam name="user">

<cfoutput>

	#contentFor(pageTitle="#user.name#'s Page")#

	<div class="container">
		<div class="page-header">
			<div class="row">
				<div class="span8">
					<h1>#user.name#</h1>
				</div>
				<div class="span8 ar">
				</div>
			</div>				
		</div>

		<div class="row">
			<div class="span10">
				#flashMessageTag()#
				<p>Joined on #DateFormat(user.createdAt, "medium")#.</p>
				<p>#linkTo(text="&larr; Back", action="index")#</p>
			</div>
			<div class="span6 ar">
				<cfif signedIn() AND user.id EQ currentUser.id>
					<span class="ar">
						#linkTo(text="Edit Profile", action="edit", key=user.id, class="btn")# &nbsp;  
						#linkTo(text="Delete Account", action="delete", key=user.id, class="btn danger", confirm="Are you sure you want to delete your account?")#
					</span>
				</cfif>
			</div>
		</div>
	</div>

</cfoutput>