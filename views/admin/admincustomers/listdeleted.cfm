<cfparam name="customers">

<cfoutput>

	#contentFor(pageTitle="Deleted Customers")#

	<div class="container">
		<div class="page-header">
			<h1>Deleted Customers</h1>
		</div>

		<div class="row">
			<div class="span4">
				#includePartial("/admin/partials/menu")#
			</div>
			<div class="span12">
				#flashMessageTag()#
				<cfif NOT customers.recordCount>
					<p>There are no deleted customers.</p>
				<cfelse>
					#startFormTag(action="undelete")#
						#submitTag(value="Undelete Selected", class="btn pull-right", key="undelete", onClick="return confirm('Are you sure you want to undelete the selected customers?');")#
						<table class="zebra-striped">
							<thead>
								<tr>
									<th colspan="2">##</th>
									<th>Name</th>
									<th>E-mail</th>
									<th>Member Since</th>
									<th>Cancelled Membership</th>
								</tr>
							</thead>
							<tbody>
								<cfloop query="customers">
									<tr>
										<td>#customers.currentRow#</td>
										<td>#checkBoxTag(name="undelete", value=customers.id)#</td>
										<td>#customers.name#</td>
										<td>#customers.email#</td>
										<td>#formatDate(customers.createdAt)#</td>
										<td>#formatDate(customers.deletedAt)#</td>
									</tr>
								</cfloop>
							</tbody>
						</table>
					#endFormTag()#
				</cfif>
			</div>
		</div>
	</div>

</cfoutput>