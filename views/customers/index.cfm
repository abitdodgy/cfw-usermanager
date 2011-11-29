<cfparam name="customer">

<cfoutput>

	#contentFor(pageTitle="#customer.name#'s Home Page")#

	<div class="container">
		<div class="page-header">
			<h1>#customer.name#'s Home Page</h1>
		</div>

		<div class="row">
			<div class="span3">
				<div class="well">
					<h3>Edit Account</h3>
					<ul>
						<li>#linkTo(text="Edit Name", action="edit", params="slug=details")#</li>
						<li>#linkTo(text="Edit E-mail", action="edit", params="slug=email")#</li>
						<li>#linkTo(text="Edit Password", action="edit", params="slug=password")#</li>
						<li>#linkTo(text="Delete Account", action="delete")#</li>
					</ul>
				</div>
			</div>
			<div class="span13">
				#flashMessageTag()#
				<cfif NOT customer.isConfirmed>
					<div class="alert-message block-message warning fade in">
						<a href="##" class="close">&times;</a>
						<p>Hello, #customer.name#,</p>
						<p>Your account has not been confirmed yet. We sent you an e-mail asking you to confirm your account. Please follow the instructions provided in the e-mail.</p>
						<p>// Comment: I will eventually add a button to resend the e-mail here.</p>
					</div>
				</cfif>
				<p>Hello, #customer.name#! This is your home page/dashboard.</p>
			</div>
		</div>
	</div>

</cfoutput>