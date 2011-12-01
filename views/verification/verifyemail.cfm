<cfoutput>

	#contentFor(pageTitle="Verify E-mail")#

	<div class="container">
		<div class="page-header">
			<h1>Verify E-mail</h1>
		</div>

		<div class="row">
			<div class="span16">
				#flashMessageTag()#
				<p>We sent you an e-mail requesting that you verify your e-mail address.</p>
				<p>If you did not receive such an e-mail, please check your spam folder to ensure it not there.</p>
				<p>#linkTo(text="Send me another one", action="sendVerificationEmail", class="btn")#</p>
			</div>
		</div>
	</div>

</cfoutput>