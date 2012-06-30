<cfoutput>

	<h1>Hi #user.name#,</h1>
	<p>We received a request to reset your password. Click the link below to reset your password:</p>
	<p>#URLFor(controller="passwordResets", action="edit", onlyPath=false, key=user.passwordResetToken)#</p>	
	<p>If you did not request a password reset, please ignore this message. Your password will remain the same.</p>
	<p>Sincerely,<br>CFW User Manager</p>

</cfoutput>