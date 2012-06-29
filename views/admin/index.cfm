<cfoutput>

	#contentFor(pageTitle="Dashboard")#

	<div class="container">
		<div class="page-header">
			<h1>Dashboard</h1>
		</div>

		<div class="row">
			<div class="span4">
				<div class="well">
					<ul>
						<li>#linkTo(text="Admin Users", controller="adminUsers", action="index")#</li>
					</ul>
				</div>
			</div>
			<div class="span12">
				<p>This is the administrative dashboard.</p>
				#flashMessageTag()#
			</div>
		</div>
	</div>

</cfoutput>