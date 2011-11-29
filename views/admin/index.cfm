<cfoutput>

	#contentFor(pageTitle="Admin Dashboard")#

	<div class="container">
		<div class="page-header">
			<h1>Admin Dashboard</h1>
		</div>

		<div class="row">
			<div class="span4">
				#includePartial("/admin/partials/menu")#
			</div>
			<div class="span12">
				<p>This is the administrative dashboard.</p>
				#flashMessageTag()#
			</div>
		</div>
	</div>

</cfoutput>