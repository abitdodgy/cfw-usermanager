<cfparam name="params.slug" default="">

<cfoutput>

	#contentFor(pageTitle="Edit Account")#

	<div class="container">
		<div class="page-header">
			<h1>Edit Account</h1>
		</div>

		<div class="row">
			<div class="span16">
				#flashMessageTag()#
				<cfswitch expression="#params.slug#">
					<cfcase value="details">
						#includePartial("forms/details")#
					</cfcase>
					<cfcase value="email">
						#includePartial("forms/email")#
					</cfcase>
					<cfcase value="password">
						#includePartial("forms/password")#
					</cfcase>
				</cfswitch>
			</div>
		</div>
	</div>

</cfoutput>