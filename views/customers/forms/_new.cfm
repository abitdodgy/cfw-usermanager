<cfoutput>

	#startFormTag(action="create")#
		<fieldset>
			<div class="clearfix">
				<label for="customer-name">Name</label>
				<div class="input">
					#textField(objectName="customer", property="name", label=false)#
					#errorMessageOn(objectName="customer", property="name")#
				</div>
			</div>
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
			<div class="clearfix">
				<label for="customer-password">Password</label>
				<div class="input">
					#passwordField(objectName="customer", property="password", label=false)#
					#errorMessageOn(objectName="customer", property="password")#
				</div>
			</div>
			<div class="clearfix">
				<label for="customer-passwordConfirmation">Confirm Password</label>
				<div class="input">
					#passwordField(objectName="customer", property="passwordConfirmation", label=false)#
					#errorMessageOn(objectName="customer", property="passwordConfirmation")#
				</div>
			</div>
			<div class="actions">
				#submitTag(value="Save", class="btn primary")#
				#linkTo(text="Cancel", route="home", class="btn")#
			</div>
		</fieldset>
	#endFormTag()#

</cfoutput>