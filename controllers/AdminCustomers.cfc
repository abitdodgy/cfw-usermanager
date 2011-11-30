component
	extends="Admin"
	hint="The admin section for users."
{
	// --------------------------------------------------
	// Public

	/** @hint Renders the list customers page. */
	public void function list() {
		customers = model("customer").findAll();
		renderPage(template="/admin/adminCustomers/list");
	}

	/** @hint Lists deleted customers. */
	public void function listDeleted() {
		customers = model("customer").findAll(where="deletedAt IS NOT NULL", includeSoftDeletes=true);
		renderPage(template="/admin/adminCustomers/listDeleted");
	}

	/** @hint Deletes selected customers. */
	public void function delete() {
		if ( StructKeyExists(params, "delete") ) {
			model("customer").deleteAll(where="id IN(#params.delete#)");
			flashInsert(message="The selected contacts were deleted successfully.", messageType="success");	
		}
		redirectTo(back=true);
	}

	/** @hint Undeletes selected customers. */
	public void function undelete() {
		if ( StructKeyExists(params, "undelete") ) {
			model("customer").updateAll(where="id IN(#params.undelete#)", deletedAt="", includeSoftDeletes=true);
			flashInsert(message="The selected contacts were undeleted successfully.", messageType="success");	
		}
		redirectTo(back=true);
	}

}