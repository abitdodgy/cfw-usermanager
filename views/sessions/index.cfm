﻿<cfparam name="params.email" default="">

<cfoutput>

	#contentFor(pageTitle="Login")#

	<div class="container">
		<div class="page-header">
			<h1>Login</h1>
		</div>

		<div class="row">
			<div class="span8">
				#flashMessageTag()#

				<p>Please enter your e-mail address and password to continue.</p>
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
							#linkTo(text="Forgot your password?", action="reset")#
						</div>
					</fieldset>
				#endFormTag()#
			</div>
			
			<div class="span7 offset1">
				<h3>Trouble signing in?</h3>
				<p>Please restart your browser. If that does not work, send an email to #mailTo(emailAddress="password@myapp.com", encode=true)#.</p>
				<h3>Don't have an account?</h3>
				<p>#linkTo(text="Sign up", controller="customers", action="new")# to get started.</p>							
			</div>
		</div>
	</div>

</cfoutput>