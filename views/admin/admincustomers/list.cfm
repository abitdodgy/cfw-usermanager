<cfparam name="customers">

<cfoutput>

	#contentFor(pageTitle="Customer List")#

	<div class="container">
		<div class="page-header">
			<h1>Customer List</h1>
		</div>

		<div class="row">
			<div class="span4">
				#includePartial("/admin/partials/menu")#
			</div>
			<div class="span12">
				#flashMessageTag()#
				#startFormTag(action="delete")#
					#submitTag(value="Delete Selected", class="btn pull-right", onClick="return confirm('Are you sure you want to delete the selected customers?');")#
					<cfif customers.recordCount>
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
								<cfloop query="customers">
									<tr>
										<td>#customers.currentRow#</td>
										<td>#checkBoxTag(name="delete", value=customers.id)#</td>
										<td>#customers.name#</td>
										<td>#customers.email#</td>
										<td>#formatDate(customers.createdAt)#</td>
									</tr>
								</cfloop>
							</tbody>
						</table>
					<cfelse>
						<p>There are no customers.</p>
					</cfif>
				#endFormTag()#
			</div>
		</div>
	</div>

</cfoutput>