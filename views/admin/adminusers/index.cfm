<cfparam name="users">

<cfoutput>

	#contentFor(pageTitle="Users")#

	<div class="container">
		<div class="page-header">
			<h1>Users</h1>
		</div>

		<div class="row">
			<div class="span16">
				#flashMessageTag()#

				#startFormTag(action="deleteByCheckBox")#
					#linkTo(text="&larr; Back", controller="admin", action="index")# #submitTag(value="Delete Selected", class="btn pull-right", onClick="return confirm('Are you sure you want to delete the selected users?');")#
					<cfif users.recordCount>
						<table class="zebra-striped">
							<thead>
								<tr>
									<th colspan="2">##</th>
									<th>Name</th>
									<th>E-mail</th>
									<th>Member Since</th>
								</tr>
							</thead>
							<tbody>
								<cfloop query="users">
									<tr>
										<td>#users.currentRow#</td>
										<td>#checkBoxTag(name="delete", value=users.id)#</td>
										<td>#linkTo(text=users.name, action="show", key=users.id)#</td>
										<td>#users.email#</td>
										<td>#formatDate(users.createdAt)#</td>
									</tr>
								</cfloop>
							</tbody>
						</table>
					<cfelse>
						<p>There are no users.</p>
					</cfif>
				#endFormTag()#
			</div>
		</div>
	</div>

</cfoutput>