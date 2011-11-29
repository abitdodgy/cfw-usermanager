<cfparam name="params.slug" default="">

<cfoutput>

	#contentFor(pageTitle="Edit Admin Account")#

	<div class="container">
		<div class="page-header">
			<h1>Edit Admin Account</h1>
		</div>

		<div class="row">
			<div class="span16">
				#flashMessageTag()#
				<cfswitch expression="#params.slug#">
					<cfcase value="details">
						#includePartial("/admin/adminSettings/forms/details")#
					</cfcase>
					<cfcase value="email">
						#includePartial("/admin/adminSettings/forms/email")#
					</cfcase>
					<cfcase value="password">
						#includePartial("/admin/adminSettings/forms/password")#
					</cfcase>
				</cfswitch>
			</div>
		</div>
	</div>

</cfoutput>