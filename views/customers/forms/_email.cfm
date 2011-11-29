<cfoutput>

	#startFormTag(action="updateEmail", key=customer.id, params="slug=#params.slug#")#
		<fieldset>
			<div class="clearfix">
				<label for="customer-currentPassword">Current Password</label>
				<div class="input">
					#passwordFieldTag(name="currentPassword", label=false)#
				</div>
			</div>
			<hr>
			<div class="clearfix">
				<label for="customer-email">E-mail</label>
				<div class="input">
					#textField(objectName="customer", property="email", label=false)#
					#errorMessageOn(objectName="customer", property="email")#
				</div>
			</div>
			<div class="clearfix">
				<label for="customer-emailConfirmation">Confirm E-mail</label>
				<div class="input">
					#textField(objectName="customer", property="emailConfirmation", label=false)#
					#errorMessageOn(objectName="customer", property="emailConfirmation")#
				</div>
			</div>
			<div class="actions">
				#submitTag(value="Save", class="btn primary")#
				#linkTo(text="Cancel", action="index", class="btn")#
			</div>
		</fieldset>
	#endFormTag()#

</cfoutput>