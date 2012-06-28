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
					<cfif signedIn() AND user.id EQ currentUser.id>
						<p>#linkTo(text="Edit Account", action="edit", key=user.id)#</p>
					</cfif>
				</div>
			</div>				
		</div>

		<div class="row">
			<div class="span13">
				#flashMessageTag()#
				<p>Hello, #user.name#! This is your home page/dashboard.</p>
			</div>
		</div>
	</div>

</cfoutput>