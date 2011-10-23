<cfoutput>

	#contentFor(pageTitle="Login - CFW User Manager")#

	<div class="container">

		<section>

			<div class="page-header">
				<h1>Login</h1>
			</div>

			#flashMessageTag()#

			<div class="row">
				<div class="span16">
					<p>Please login to continue.</p>
				</div>
			</div>

			<div class="row">
				<div class="span16">
					#startFormTag(action="login")#
						<fieldset>
							<div class="clearfix">
								<label for="email">E-mail Address</label>
								<div class="input">
									#textFieldTag(name="email", value=params.email, label=false)#
								</div>
							</div>
							<div class="clearfix">
								<label for="password">Password</label>
								<div class="input">
									#passwordFieldTag(name="password", label=false)#
								</div>
							</div>
							<div class="actions">
								#submitTag(value="Login", class="btn primary")#
								#linkTo(action="reset", text="Forgot your password?")#
							</div>
						</fieldset>
					#endFormTag()#
				</div>
			</div>

		</section>

	</div>

</cfoutput>