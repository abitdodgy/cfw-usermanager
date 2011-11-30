<cfoutput>

	#contentFor(pageTitle="Password Reset")#

	<div class="container">
		<div class="page-header">
			<h1>Password Reset</h1>
		</div>

		<div class="row">
			<div class="span10">
				#flashMessageTag()#

				<p>Please enter a new password.</p>

				#startFormTag(action="update", key=params.key)#
					<fieldset>
						<div class="clearfix">
							<label for="email">Password</label>
							<div class="input">
								#passwordField(objectName="user", property="password", label=false)#
							</div>
						</div>
						<div class="clearfix">
							<label for="email">Confirm Password</label>
							<div class="input">
								#passwordField(objectName="user", property="passwordConfirmation", label=false)#
							</div>
						</div>
						<div class="actions">
							#submitTag(value="Save", class="btn primary")#
						</div>
					</fieldset>
				#endFormTag()#
			</div>
		</div>
	</div>

</cfoutput>