<cfparam name="user">

<cfoutput>

	#contentFor(pageTitle="#user.name#'s Profile")#

	<div class="container">
		<div class="row">
			<div class="span12">
				#flashMessageTag()#
				<h3>#user.name#</h3>
				<p>This is #user.name#'s page.</p>
				<p>#linkTo(text="&larr; Back", action="index")#</p>
			</div>
			<div class="span4 ar">
				<p>#linkTo(text="Delete User", action="delete", key=user.id, class="btn danger")#</p>
			</div>
		</div>
	</div>

</cfoutput>