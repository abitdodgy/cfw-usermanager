<cfoutput>

	#contentFor(pageTitle="Edit Account")#

	<div class="container">
		<div class="page-header">
			<h1>Edit Account</h1>
		</div>

		<div class="row">
			<div class="span16">
				#flashMessageTag()#

				#startFormTag(action="update", key=user.key())#
					<fieldset>
						#includePartial("userForm")#
						<div class="actions">
							#submitTag(value="Save", class="btn primary")#
							#linkTo(text="Cancel", route="profile", key=user.id, class="btn")#
						</div>
					</fieldset>
				#endFormTag()#				
			</div>
		</div>
	</div>

</cfoutput>