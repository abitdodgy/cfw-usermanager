<cfoutput>

	<h1>Dear #user.name#,</h1>
	<p>You need to confirm your e-mail address. Please click on the link below to do so:</p>
	<p>#URLFor(controller="confirmations", action="update", onlyPath=false, key=user.emailConfirmationToken)#</p>
	<p>If clicking the above link does not work, just copy it and paste the URL in a new browser window instead.</p>	
	<p>Thanks!</p>

</cfoutput>