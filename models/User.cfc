component
	extends="Model"
	hint="Base User model"
{
	/*
	 * @hint Constructor
	 */
	public void function init() {
		belongsTo("role");
		hasOne(name="passwordToken", modelName="tokenPassword", foreignKey="userId", dependent="delete");
		hasOne(name="emailToken", modelName="tokenEmail", foreignKey="userId", dependent="delete");

		afterSave("setSession");
		beforeSave("sanitize,securePassword,setEmailVerificationOnUpdate");
		beforeValidation("setSalt");

		property(name="isConfirmed", default="0");

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

	/*
	 * @hint Initiates email verification process on e-mail update.
	 * @note Reverts the email to its original value until the new address is verified.
	 */
	private void function setEmailVerificationOnUpdate() {
		if ( ! this.isNew() && this.hasChanged("email") ) {
			this.emailToken = this.emailToken();
			
			if ( IsObject(this.emailToken) ) {
				this.emailToken = this.emailToken.update(generateTokenValue(this.email));
			}
			else {
				this.emailToken = this.createEmailToken(generateTokenValue(this.email));
				this.email = this.changedFrom("email");				
			}
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
	 * @hint Generates a token.
	 * @pendingValue Holds a temporary value; an update email address that's pending verification, for example.
	 * @validForInHours The number of days this token is valid for.
	 */
	public struct function generateTokenValue(string pendingValue="", numeric validForInHours=24) {
		var token = {
			expires = DateAdd("h", arguments.validForInHours, Now()),
			pendingValue = arguments.pendingValue,
			value = Rereplace(CreateUUID(), "-", "", "all")
		};
		return token;
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

	/*
	 * @hint Sets the user session.
	 */
	private void function setSession() {
		if ( ! StructKeyExists(this, "role") ) {
			this.role = this.role();
		}
		connect(this);
	}

}