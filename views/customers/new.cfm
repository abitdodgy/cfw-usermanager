<cfoutput>

	#contentFor(pageTitle="Sign-up")#

	<div class="container">
		<div class="page-header">
			<h1>Sign-up</h1>
		</div>

		<div class="row">
			<div class="span16">
				#flashMessageTag()#
				#includePartial("forms/new")#
			</div>
		</div>
	</div>

</cfoutput>