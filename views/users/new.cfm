<cfparam name="user">

<cfoutput>

	#contentFor(pageTitle="Signup - CFW User Manager Demo")#

	<div class="container">

		<section>

			<div class="page-header">
				<h1>Sign Up</h1>
			</div>

			<div class="row">
				<div class="span16">
					#includePartial("forms/new")#
				</div>
			</div>

		</section>

	</div>

</cfoutput>