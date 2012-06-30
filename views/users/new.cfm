<cfoutput>

	#contentFor(pageTitle="Sign-up")#

	<div class="container">
		<div class="page-header">
			<h1>Sign-up</h1>
		</div>

		<div class="row">
			<div class="span16">
				#flashMessageTag()#
				#startFormTag(action="create")#
					<fieldset>
						#includePartial("userForm")#
						<div class="actions">
							#submitTag(value="Save", class="btn primary")#
							#linkTo(text="Cancel", route="home", class="btn")#
						</div>
					</fieldset>
				#endFormTag()#
			</div>
		</div>
	</div>

</cfoutput>