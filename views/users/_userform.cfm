<cfoutput>

	<div class="clearfix">
		<label for="user-name">Name</label>
		<div class="input">
			#textField(objectName="user", property="name", label=false)#
			#errorMessageOn(objectName="user", property="name")#
		</div>
	</div>
	<div class="clearfix">
		<label for="user-email">E-mail</label>
		<div class="input">
			#textField(objectName="user", property="email", label=false)#
			#errorMessageOn(objectName="user", property="email")#
		</div>
	</div>
	<div class="clearfix">
		<label for="user-password">Password</label>
		<div class="input">
			#passwordField(objectName="user", property="password", label=false)#
			#errorMessageOn(objectName="user", property="password")#
		</div>
	</div>
	<div class="clearfix">
		<label for="user-passwordConfirmation">Confirm Password</label>
		<div class="input">
			#passwordField(objectName="user", property="passwordConfirmation", label=false)#
			#errorMessageOn(objectName="user", property="passwordConfirmation")#
		</div>
	</div>

</cfoutput>