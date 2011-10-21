<cfoutput>

	#startFormTag(action="update", params="slug=#params.slug#")#
		<fieldset>
			<div class="clearfix">
				<label for="user-name">Name</label>
				<div class="input">
					#textField(objectName="user", property="name", label=false)#
					#errorMessageOn(objectName="user", property="name")#
				</div>
			</div>
			<div class="actions">
				#submitTag(value="Save", class="btn primary")#
				#linkTo(text="Cancel", action="index", class="btn")#
			</div>
		</fieldset>
	#endFormTag()#

</cfoutput>