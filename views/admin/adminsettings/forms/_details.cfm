<cfoutput>

	#startFormTag(action="update", key=admin.id, params="slug=#params.slug#")#
		<fieldset>
			<div class="clearfix">
				<label for="admin-name">Name</label>
				<div class="input">
					#textField(objectName="admin", property="name", label=false)#
					#errorMessageOn(objectName="admin", property="name")#
				</div>
			</div>
			<div class="actions">
				#submitTag(value="Save", class="btn primary")#
				#linkTo(text="Cancel", controller="admin", action="index", class="btn")#
			</div>
		</fieldset>
	#endFormTag()#

</cfoutput>