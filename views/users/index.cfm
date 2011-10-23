<cfoutput>

	#contentFor(pageTitle="#user.name# My Home Page - CFW User Manager Demo")#

	<div class="container">

		<section>

			<div class="page-header">
				<h1>Hello #user.name#</h1>
			</div>

			#flashMessageTag()#

			<div class="row">
				<div class="span5">
					<div class="well">
						<h3>Settings</h3>
						<ul>
							<li>#linkTo(text="Edit Name", action="edit", params="slug=profile")#</li>
							<li>#linkTo(text="Edit E-mail", action="edit", params="slug=email")#</li>
							<li>#linkTo(text="Edit Password", action="edit", params="slug=password")#</li>
							<li>#linkTo(text="Delete Profile", action="delete", confirm="Are you sure you want to delete your profile?")#</li>
						</ul>
					</div>
				</div>
				<div class="span11">
					<h2>User's Home Page</h2>
					<p>This is your home page.</p>
				</div>
			</div>

		</section>

	</div>

</cfoutput>