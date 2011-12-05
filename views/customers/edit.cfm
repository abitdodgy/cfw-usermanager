<cfoutput>

	#contentFor(pageTitle="Edit Account")#

	<div class="container">
		<div class="page-header">
			<h1>Edit Account</h1>
		</div>

		<div class="row">
			<div class="span16">
				#flashMessageTag()#

				#startFormTag(action="update")#
					<fieldset>
						<div class="clearfix">
							<label for="customer-name">Name</label>
							<div class="input">
								#textField(objectName="customer", property="name", label=false)#
								#errorMessageOn(objectName="customer", property="name")#
							</div>
						</div>
						<div class="actions">
							#submitTag(value="Save", class="btn primary")#
							#linkTo(text="Cancel", action="index", class="btn")#
						</div>
					</fieldset>
				#endFormTag()#				
			</div>
		</div>
	</div>

</cfoutput>