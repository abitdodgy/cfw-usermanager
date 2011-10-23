<cfparam name="user">

<cfoutput>

	#contentFor(pageTitle="Edit Profile - CFW User Manager Demo")#

	<div class="container">

		<section>

			<div class="page-header">
				<h1>Edit Profile</h1>
			</div>

			#flashMessageTag()#

			<div class="row">
				<div class="span16">
					<cfswitch expression="#params.slug#">
						<cfcase value="email">
							#includePartial("forms/editEmail")#
						</cfcase>
						<cfcase value="password">
							#includePartial("forms/editPassword")#
						</cfcase>
						<cfdefaultcase>
							#includePartial("forms/editProfile")#
						</cfdefaultcase>
					</cfswitch>
				</div>
			</div>

		</section>

	</div>

</cfoutput>