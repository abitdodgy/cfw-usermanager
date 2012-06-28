<cfoutput>

	#contentFor(pageTitle="CFW User Manager Demo App - Home Page")#

	<div class="container">
		<div class="page-header">
			<h1>CFWheels User Manager</h1>
		</div>
		<div class="row">
			<div class="span8">
				#flashMessageTag()#
				<p>This is the public facing home page of the demo app. Assuming you created the data source and the database using the provided SQL file, see the users table accross for usage details.</p>
				<p>#linkTo(text="Sign in", route="signIn", class="btn primary")# &nbsp; #linkTo(text="Sign Up", route="signUp", class="btn danger")#</p>
			</div>
			<div class="span8">
				<div class="well">
					<p>You can login with the following credentials:</p>
					<table>
						<thead>
							<tr>
								<th>Username</th>
								<th>Password</th>
								<th>Role</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>admin@cfwdemo.com</td>
								<td>demo2012</td>
								<td>Admin</td>
							</tr>
							<tr>
								<td>lisa@cfwdemo.com</td>
								<td>demo2012</td>
								<td>Customer</td>
							</tr>
							<tr>
								<td>bart@cfwdemo.com</td>
								<td>demo2012</td>
								<td>Customer</td>
							</tr>
						</tbody>
					</table>
					<p>Bart's account has not been confirmed, while Lisa's has.</p>
					<p>There is a deleted account you can view in the admin section that belongs to Barney.</p>
				</div>
			</div>
		</div>
	</div>

</cfoutput>