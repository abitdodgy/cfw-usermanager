<cfparam name="users">

<cfoutput>

	#contentFor(pageTitle="CFWheels User Manager")#

	<div class="container">
		<div class="page-header">
			<div class="row">
				<div class="span8">
					<h1>Members</h1>
				</div>
			</div>				
		</div>

		<div class="row">
			<cfloop query="users">
				<div class="span4">
					<div class="well">
						<h5>#users.name#</h5>
						<p>Joined on #formatDate(users.createdAt)#</p>
						<p>Confirmed: #users.confirmed ? "Yes" : "No"#</p>
						<p>#linkTo(text="View Profile", route="profile", key=users.id)#</p>
					</div>
				</div>
			</cfloop>
		</div>
	</div>

</cfoutput>