<cfoutput>

	#startFormTag(action="update", key=customer.id, params="slug=#params.slug#")#
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

</cfoutput>