<cfoutput>

	<div class="well">
		<p><strong>Admin</strong></p>
		<ul>
			<li>#linkTo(text="Dashboard", controller="admin", action="index")#</li>
			<li>#linkTo(text="Edit Details", controller="adminSettings", action="edit", params="slug=details")#</li>
			<li>#linkTo(text="Edit E-mail", controller="adminSettings", action="edit", params="slug=email")#</li>
			<li>#linkTo(text="Edit Password", controller="adminSettings", action="edit", params="slug=password")#</li>
		</ul>
		<p><strong>Customers</strong></p>
		<ul>
			<li>#linkTo(text="List Customers", controller="adminCustomers", action="list")#</li>
			<li>#linkTo(text="Deleted Customers", controller="adminCustomers", action="listDeleted")#</li>
		</ul>
	</div>

</cfoutput>