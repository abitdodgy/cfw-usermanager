<cffunction name="flashMessageTag" access="public" output="false" returnType="string" hint="Flashes any avalable messages in the flash.">
	<cfset local.html = "">
	<cfif flashKeyExists("message")>
		<cfsavecontent variable="local.html">
			<cfoutput>
				<div class="alert-message block-message #flash('messageType')# fade in" data-alert="alert">
					<a href="##" class="close">&times;</a>
					<p>#flash("message")#</p>
				</div>
			</cfoutput>
		</cfsavecontent>
	</cfif>
	<cfreturn local.html>
</cffunction>

<cffunction name="formatDate" access="public" output="false" returnType="string" hint="Formats a date/time string.">
	<cfargument name="string" type="date" required="true" hint="The date to format">
	<cfreturn DateFormat(arguments.string, "medium")>
</cffunction>