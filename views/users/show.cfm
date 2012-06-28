<cfparam name="user">

<cfoutput>

	#contentFor(pageTitle="#user.name#'s Page")#

	<div class="container">
		<div class="page-header">
			<h1>#user.name#'s Page</h1>
		</div>

		<div class="row">
			<div class="span3">
				<div class="well">
					<h3>Edit Account</h3>
					<ul>
						<li>#linkTo(text="Edit Account", action="edit")#</li>
						<li>#linkTo(text="Delete Account", action="delete")#</li>
					</ul>
				</div>
			</div>
			<div class="span13">
				#flashMessageTag()#
				<p>Hello, #user.name#! This is your home page/dashboard.</p>
			</div>
		</div>
	</div>

</cfoutput>