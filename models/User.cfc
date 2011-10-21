/**
 * @hint Base User model.
 */
component
	extends="Model"
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		belongsTo("role");
		hasMany("tokens");

		afterSave("setSession");
		beforeSave("sanitize,securePassword");
		beforeValidation("setSalt");

		property(name="confirmed", defaultValue="0");
		property(name="roleId", defaultValue="1");

		validatesConfirmationOf("password,email");
		validatesFormatOf("email");
		validatesPresenceOf("name,email,password,roleId");
		validatesUniquenessOf("email");
	}

	// --------------------------------------------------    
    // Callbacks

	/*
	 * @hint Sanitizes the user object.
	 */
	private void function sanitize() {
		this.name = HtmlEditFormat(this.name);
	}

	/*
	 * @hint Secures the user object's' password before saving it.
	 */
	private void function securePassword() {
		if ( StructKeyExists(this, "password") ) {
			this.password = hashPassword(this.password, this.salt);	
		}
	}

	/*
	 * @hint Creates a salt string to use for hashing the password.
	 */
	private void function setSalt() {
		this.salt = CreateUUID();
	}

	// --------------------------------------------------    
    // Public

	/**
	 * @hint Authenticates a user object.
	 */
	public boolean function authenticate(required string password) {
		if ( ! Compare(this.password, hashPassword(arguments.password, this.salt)) ) {
			this.setSession();
			return true;
		}
		return false;
	}

	/*
	 * @hint Generates an expiring security token for password resets and account conrimation.
	 */
	public void function generateSecurityToken() {
		this.token = this.createToken(token=CreateUUID(), expires=DateAdd("d", 1, Now()));
	}

	/*
	 * @hint Generates a temporary password used when users reset their password.
	 * @note If a user does not change their password after resetting it, they will have to reset it again.
	 */
	public void function generateTemporaryPassword() {
		this.password = CreateUUID();
	}

	// --------------------------------------------------    
    // Private

	/*
	 * @hint Hashes a password string.
	 */
	private string function hashPassword(required string password, required string salt) {
		for (local.i = 1; local.i <= 1024; local.i++) {
			local.password = Hash(arguments.password & arguments.salt, "SHA-512");
		}
		return local.password;
	}

	/*
	 * @hint Sets the user session.
	 * @todo This is a bit of a hack. In order to reuse this function for logging in, and authenticating after a use is created,
	 * We have to check and see if user.role is passed in. This is because user.role is included when the user logs in, but not when creating a new user.
	 * We could deal with this by using nested properties to ensure the role object is always passed in, but the security might be abit iffy; we might have to force-set the role in the controller, based on where the user its.
	 */
	private void function setSession() {
		if ( ! StructKeyExists(this, "role") ) {
			this.role = this.role(select="name AS roleName");
		}
		connectUser(this);
	}

}