<cfparam name="user">

<cfoutput>

	#contentFor(pageTitle="#user.name#'s Profile")#

	<div class="container">
		<div class="row">
			<div class="span12">
				#flashMessageTag()#
				<h3>#user.name#</h3>
				<p>Joined on #formatDate(user.createdAt)#.</p>
				<p>#linkTo(text="&larr; Back", action="index")#</p>
			</div>
			<div class="span4 ar">
				<p>#linkTo(text="Delete User", action="delete", key=user.id, class="btn danger", confirm="Are you sure you want to delete this user?")#</p>
			</div>
		</div>
	</div>

</cfoutput>