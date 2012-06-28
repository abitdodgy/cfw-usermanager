<cfcomponent output="false" displayname="Single Table Inheritance" mixin="model">

	
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfset this.version = "1.1" />
		<cfreturn this />
	</cffunction>
	
	
	<!--- public methods --->
	
	<cffunction name="singleTableInheritance" returntype="void" access="public" mixin="model" output="false">
		<cfargument name="tableName" type="string" required="true">
		<cfargument name="typeColumn" type="string" default="type">
		<cfargument name="typeValue" type="any" default="#ListLast(GetMetaData(this).name, '.')#">
		<cfset variables.wheels.class.singleTableInheritance = Duplicate(arguments)>
		<cfset table(name=arguments.tableName)>
		<cfset beforeValidationOnCreate(methods="$sti_setTypeValue")>
		<cfset property(name=arguments.typeColumn, defaultValue=arguments.typeValue)>
	</cffunction>
	
	
	<cffunction name="findAll" returntype="any" access="public" mixin="model" output="false">
		<cfset var coreMethod = core.findAll>
		<cfif StructKeyExists(variables.wheels.class, "singleTableInheritance")>
			<cfset arguments.where = $sti_addWhereClause(argumentCollection=arguments)>
		</cfif>
		<cfreturn coreMethod(argumentCollection=arguments)>
	</cffunction>


	<cffunction name="updateAll" returntype="any" access="public" mixin="model" output="false">
		<cfset var coreMethod = core.updateAll>
		<cfif StructKeyExists(variables.wheels.class, "singleTableInheritance")>
			<cfset arguments.where = $sti_addWhereClause(argumentCollection=arguments)>
		</cfif>
		<cfreturn coreMethod(argumentCollection=arguments)>
	</cffunction>


	<cffunction name="deleteAll" returntype="any" access="public" mixin="model" output="false">
		<cfset var coreMethod = core.deleteAll>
		<cfif StructKeyExists(variables.wheels.class, "singleTableInheritance")>
			<cfset arguments.where = $sti_addWhereClause(argumentCollection=arguments)>
		</cfif>
		<cfreturn coreMethod(argumentCollection=arguments)>
	</cffunction>
	
	
	<!--- private methods --->
	
	<cffunction name="$sti_addWhereClause" returntype="string" access="public" mixin="model" output="false">
		<cfargument name="where" type="string" default="">
		<cfif Len(arguments.where)>
			<cfset arguments.where = arguments.where & " AND ">
		</cfif>
		<cfset arguments.where = arguments.where & "#variables.wheels.class.singleTableInheritance.typeColumn#='#variables.wheels.class.singleTableInheritance.typeValue#'">
		<cfreturn arguments.where>
	</cffunction>
	

	<cffunction name="$sti_setTypeValue" returntype="boolean" access="public" mixin="model" output="false">
		<cfset this[variables.wheels.class.singleTableInheritance.typeColumn] = variables.wheels.class.singleTableInheritance.typeValue>
		<cfreturn true>
	</cffunction>


</cfcomponent>