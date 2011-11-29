component
	extends="User"
	hint="The admin user model."
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		super.init();
		singleTableInheritance(tableName="users", typeColumn="roleId", typeValue="2");
	}

}