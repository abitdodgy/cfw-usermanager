<cfoutput>

	<p>Enter your existing password along with your new one.</p>

	#startFormTag(action="updatePassword", key=admin.id, params="slug=#params.slug#")#
		<fieldset>
			<div class="clearfix">
				<label for="admin-currentPassword">Current Password</label>
				<div class="input">
					#passwordFieldTag(name="currentPassword", label=false)#
				</div>
			</div>
			<hr>
			<div class="clearfix">
				<label for="admin-password">New Password</label>
				<div class="input">
					#passwordField(objectName="admin", property="password", label=false)#
					#errorMessageOn(objectName="admin", property="password")#
				</div>
			</div>
			<div class="clearfix">
				<label for="admin-passwordConfirmation">Confirm Password</label>
				<div class="input">
					#passwordField(objectName="admin", property="passwordConfirmation", label=false)#
					#errorMessageOn(objectName="admin", property="passwordConfirmation")#
				</div>
			</div>
			<div class="actions">
				#submitTag(value="Save", class="btn primary")#
				#linkTo(text="Cancel", controller="admin", action="index", class="btn")#
			</div>
		</fieldset>
	#endFormTag()#

</cfoutput>