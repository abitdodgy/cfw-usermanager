component
	displayname="Email Token"
	extends="Token"
	hint="Stores tokens related to email verification."
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		super.init();
		singleTableInheritance(tableName="tokens", typeColumn="typeId", typeValue="1");
	}

}