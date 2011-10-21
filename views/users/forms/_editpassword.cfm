<cfoutput>

	#startFormTag(action="update", params="slug=#params.slug#")#
		<fieldset>
			<div class="clearfix">
				<label for="user-password">Password</label>
				<div class="input">
					#passwordFieldTag(name="user[password]", label=false)#
					#errorMessageOn(objectName="user", property="password")#
				</div>
			</div>
			<div class="clearfix">
				<label for="user-passwordConfirmation">Confirm Password</label>
				<div class="input">
					#passwordFieldTag(name="user[passwordConfirmation]", label=false)#
					#errorMessageOn(objectName="user", property="passwordConfirmation")#
				</div>
			</div>
			<div class="actions">
				#submitTag(value="Save", class="btn primary")#
				#linkTo(text="Cancel", action="index", class="btn")#
			</div>
		</fieldset>
	#endFormTag()#

</cfoutput>