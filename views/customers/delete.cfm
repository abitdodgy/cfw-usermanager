<cfoutput>

	#contentFor(pageTitle="Delete Account")#

	<div class="container">
		<div class="page-header">
			<h1>Delete Account</h1>
		</div>

		<div class="row">
			<div class="span16">
				#flashMessageTag()#
				<p>Please enter your password to delete your account.</p>
				#startFormTag(action="doDelete")#
					<fieldset>
						<div class="clearfix">
							<label for="customer-currentPassword">Current Password</label>
							<div class="input">
								#passwordFieldTag(name="currentPassword", label=false)#
							</div>
						</div>
						<div class="actions">
							#submitTag(value="Yes, delete it!", action="doDelete", onClick="return confirm('Are you sure you want to delete your account?')", class="btn danger")# &nbsp; #linkTo(text="Nah, keep it!", action="index", class="btn")#
						</div>
					</fieldset>
				#endFormTag()#
			</div>
		</div>
	</div>

</cfoutput>