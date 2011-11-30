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

				#startFormTag(action="sendInstructions")#
					<fieldset>
						<div class="clearfix">
							<label for="email">E-mail Address</label>
							<div class="input">
								#textFieldTag(name="email", label=false)#
							</div>
						</div>
						<div class="actions">
							#submitTag(value="Reset", class="btn primary")#
						</div>
					</fieldset>
				#endFormTag()#
			</div>
		</div>
	</div>

</cfoutput>