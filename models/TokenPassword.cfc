component
	extends="Token"
	hint="The TokenPassword model stores tokens used for password reset requests."
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		super.init();
		singleTableInheritance(tableName="tokens", typeColumn="typeId", typeValue="2");
	}

}