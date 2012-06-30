component
	extends="Model"
	hint="Base User model"
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		beforeSave("sanitize,securePassword");
		beforeValidation("setSalt");

		validatesConfirmationOf("email,password");
		validatesFormatOf(property="email", type="email");
		validatesFormatOf(property="password", regEx="^.*(?=.{8,})(?=.*\d)(?=.*[a-z]).*$", message="Your password must be at least 8 characters long and contain a mixture of numbers and letters.");
		validatesPresenceOf("name,email,password");
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
	 * @hint Secures the password property before saving it.
	 */
	private void function securePassword() {
		if ( StructKeyExists(this, "passwordConfirmation") ) {
			this.password = hashPassword(this.password, this.salt);	
		}
	}

	/**
	 * @hint Sets the salt property for the password.
	 */
	private void function setSalt() {
		if ( StructKeyExists(this, "passwordConfirmation") ) {
			this.salt = GenerateSecretKey("AES", 256);
		}
	}

	// --------------------------------------------------
	// Public

	/**
	 * @hint Authenticates a user object.
	 */
	public boolean function authenticate(required string password) {
		return ! Compare(this.password, hashPassword(arguments.password, this.salt));
	}

	/**
	 * @hint Creates a password reset token
	 */
	public void function createPasswordResetToken() {
		this.passwordResetToken = URLEncodedFormat(GenerateSecretKey("AES", 256));
		this.passwordResetAt = Now();
		this.save();
	}

	/*
	 * @hint Convenience method to blank user password.
	 */
	public void function passwordToBlank() {
		if ( StructKeyExists(this, "password") ) this.password = "";
		if ( StructKeyExists(this, "passwordConfirmation") ) this.passwordConfirmation = "";
	}

	// --------------------------------------------------
	// Private

	/*
	 * @hint Hashes a password string.
	 */
	private string function hashPassword(required string password, required string salt) {
		for (var i = 1; i <= 1024; i++) {
			arguments.password = Hash(arguments.password & arguments.salt, "SHA-512");
		}
		return arguments.password;
	}

}