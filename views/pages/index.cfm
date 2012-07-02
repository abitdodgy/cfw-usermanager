<cfoutput>

	#contentFor(pageTitle="CFW User Manager Demo App - Home Page")#

	<div class="container">
		<div class="page-header">
			<h1>CFWheels User Manager</h1>
		</div>
		<div class="row">
			<div class="span7">
				#flashMessageTag()#
				<p>Assuming you created the data source and the database using the provided SQL file, see the users table accross for usage details.</p>
				<p>#linkTo(text="Sign in", route="signIn", class="btn primary")# &nbsp; #linkTo(text="Sign Up", route="signUp", class="btn danger")#</p>
			</div>
			<div class="span9">
				<div class="well">
					<p>You can login with the following credentials:</p>
					<table>
						<thead>
							<tr>
								<th>Name</th>
								<th>Username</th>
								<th>Password</th>
								<th>Role</th>
							</tr>
						</thead>
						<tbody>
							<cfloop query="users">
								<tr>
									<td>#users.name#</td>
									<td>#users.email#</td>
									<td>demo2012</td>
									<td>#users.admin ? "Admin" : "User"#</td>
								</tr>
							</cfloop>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</cfoutput>