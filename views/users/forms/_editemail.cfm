<cfoutput>

	#startFormTag(action="update", params="slug=#params.slug#")#
		<fieldset>
			<div class="clearfix">
				<label for="user-email">E-mail</label>
				<div class="input">
					#textField(objectName="user", property="email", label=false)#
					#errorMessageOn(objectName="user", property="email")#
				</div>
			</div>
			<div class="clearfix">
				<label for="user-emailConfirmation">Confirm E-mail</label>
				<div class="input">
					#textField(objectName="user", property="emailConfirmation", label=false)#
					#errorMessageOn(objectName="user", property="emailConfirmation")#
				</div>
			</div>
			<div class="actions">
				#submitTag(value="Save", class="btn primary")#
				#linkTo(text="Cancel", action="index", class="btn")#
			</div>
		</fieldset>
	#endFormTag()#

</cfoutput>