<cfoutput>

	#startFormTag(action="updateEmail", key=admin.id, params="slug=#params.slug#")#
		<fieldset>
			<div class="clearfix">
				<label for="admin-currentPassword">Current Password</label>
				<div class="input">
					#passwordFieldTag(name="currentPassword", label=false)#
				</div>
			</div>
			<hr>
			<div class="clearfix">
				<label for="admin-email">E-mail</label>
				<div class="input">
					#textField(objectName="admin", property="email", label=false)#
					#errorMessageOn(objectName="admin", property="email")#
				</div>
			</div>
			<div class="clearfix">
				<label for="admin-emailConfirmation">Confirm E-mail</label>
				<div class="input">
					#textField(objectName="admin", property="emailConfirmation", label=false)#
					#errorMessageOn(objectName="admin", property="emailConfirmation")#
				</div>
			</div>
			<div class="actions">
				#submitTag(value="Save", class="btn primary")#
				#linkTo(text="Cancel", controller="admin", action="index", class="btn")#
			</div>
		</fieldset>
	#endFormTag()#

</cfoutput>