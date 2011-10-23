<cffunction name="flashMessageTag" access="public" output="false" returnType="string" hint="Flashes any avalable messages in the flash.">
	<cfset local.html = "">
	<cfif flashKeyExists("message")>
		<cfsavecontent variable="local.html">
			<cfoutput>
				<div class="row">
					<div class="span16">
						<div class="alert-message block-message #flash('messageType')# fade in" data-alert="alert">
							<a href="##" class="close">&times;</a>
							<p>#flash("message")#</p>
						</div>
					</div>
				</div>
			</cfoutput>
		</cfsavecontent>
	</cfif>
	<cfreturn local.html>
</cffunction>