component
	extends="Token"
	hint="The TokenEmail model stores tokens used for e-mail verification."
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		super.init();
		singleTableInheritance(tableName="tokens", typeColumn="typeId", typeValue="1");
	}

}