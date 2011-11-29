component
	displayname="Password Token"
	extends="Token"
	hint="Stores tokens related to password reset requests."
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		super.init();
		singleTableInheritance(tableName="tokens", typeColumn="typeId", typeValue="2");
	}

}