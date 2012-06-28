component extends="Controller" {

	// Constructor
	
	public void function init() {
		
	}
	
	// Filters
	
	// REST Actions
	
	public void function show() {
		user = model("user").findByKey(params.key);
	}
	
	public void function new() {
		
	}
	
	public void function create() {
		
	}
}