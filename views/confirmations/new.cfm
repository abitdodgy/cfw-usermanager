<cfoutput>

	#contentFor(pageTitle="Email Confirmation")#

	<div class="container">
		<div class="page-header">
			<h1>Email Confirmation</h1>
		</div>

		<div class="row">
			<div class="span10">
				#flashMessageTag()#

				<cfif user.confirmed>
					<p>Your email address has been confirmed previously.</p>
				<cfelse>
					<p>Click below to receive a new email with instructions for confirming your account.</p>
				</cfif>

				#startFormTag(action="create", key=user.id)#
					<fieldset>
						<div class="clearfix">
							<label for="email">E-mail Address</label>
							<div class="input">
								#textField(objectName="user", property="email", label=false, disabled=true)#
							</div>
						</div>
						<div class="actions">
							#submitTag(value="Send Email", class="btn primary")# #linkTo(text="Cancel", controller="sessions", action="new", class="btn")#
						</div>
					</fieldset>
				#endFormTag()#
			</div>
		</div>
	</div>

</cfoutput>