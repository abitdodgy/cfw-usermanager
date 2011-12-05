<cfoutput>

	#contentFor(pageTitle="Edit Password")#

	<div class="container">
		<div class="page-header">
			<h1>Edit Password</h1>
		</div>

		<div class="row">
			<div class="span16">
				#flashMessageTag()#

				<p>Enter your existing password along with a new one.</p>

				#startFormTag(action="updatePassword")#
					<fieldset>
						<div class="clearfix">
							<label for="customer-currentPassword">Current Password</label>
							<div class="input">
								#passwordFieldTag(name="currentPassword", label=false)#
							</div>
						</div>
						<hr>
						<div class="clearfix">
							<label for="customer-password">New Password</label>
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
							#linkTo(text="Cancel", action="index", class="btn")#
						</div>
					</fieldset>
				#endFormTag()#
			</div>
		</div>
	</div>

</cfoutput>