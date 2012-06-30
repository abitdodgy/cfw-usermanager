<cfoutput>

	#contentFor(pageTitle="Password Reset")#

	<div class="container">
		<div class="page-header">
			<h1>Password Reset</h1>
		</div>

		<div class="row">
			<div class="span10">
				#flashMessageTag()#

				<p>Enter your e-mail address to receive instructions for reseting your password.</p>

				#startFormTag(action="create")#
					<fieldset>
						<div class="clearfix">
							<label for="email">E-mail Address</label>
							<div class="input">
								#textFieldTag(name="email", label=false)#
							</div>
						</div>
						<div class="actions">
							#submitTag(value="Send Reset Email", class="btn primary")# #linkTo(text="Cancel", controller="sessions", action="new", class="btn")#
						</div>
					</fieldset>
				#endFormTag()#
			</div>
		</div>
	</div>

</cfoutput>