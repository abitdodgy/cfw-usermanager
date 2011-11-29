<cfoutput>

	#contentFor(pageTitle="Password Reset")#

	<div class="container">
		<div class="page-header">
			<h1>Password Reset</h1>
		</div>

		<div class="row">
			<div class="span8">
				#flashMessageTag()#

				<p>Please enter your e-mail address to continue. We will e-mail you instructions to reset your password.</p>
				#startFormTag(action="reset")#
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