ColdFusion on Wheels User Manager Demo
======================================

User Manager is a demo app for ColdFusion on Wheels. It's meant to be a toolkit for learning or kickstarting a project that requires session management and authorization functionality.


Current Version 2.2.0
---------------------

Current version includes the following functionality:

* Registration;
* Authentication;
* CRUD functionality for User model;
* Password hashing and salting using bCrypt;
* Expiring password resets with confirmation e-mail;
* Email confirmation;
* Admin authorization;
* Admin CRUD for managing users.
* Friendly redirects

Change Log
----------

This change requires a new SQL file (included). The following changes have been made:

**Version 2.2.0**
* Added a new RESTful Confirmations.cfc controller for confirming email addresses.
* Added two columns in the schema: boolean confirmed, and varchar confirmation token.
* Added new SQL file.
* Refactored how tokens are generated now for password resets and confirmations. Using a stripped UUID as generate secret key was causing bad URLs.
* Added an Admin link if the user is signed in as an admin.
* Moved isAthorized method to Controller.cfc so it can be reused by Confirmations.cfc.
* Added new callback to create a confirmation token when the user signs up.
* Removed dead code and email templates left over from version 1.
* Users#index.cfm now shows confirmation status for users.
* Switched all places from using DateFormat() to a custom formatDate(). This makes changing the date format easier as it's in a single place.


**Version 2.1.2**
* Switched password hashing from using a SHA-512 over 1024 iterations to using BCrypt.

**Version 2.1.1**
* Added friendly redirects.
* Minor bug fixes and dead code clean-up.

**Version 2.1.0**
* New RESTful Sessions controller.
* New RESTful password resets controller.
* No longer using a separate table to store password reset tokens. Password reset tokens are now stored in their own column in the users table. The previous release complicated things needlessly.
* Removed account verification. Will add this at a later stage.
* Change database schema: dropped the tokens and roles tables.
* Massive refactoring.
* Changed schema again. The role is not a boolean column in the users table. This means refactoring authorization and authentication, and rereating the schema. SQL file has been included.

Coming Soon
-----------

* Update to Bootstrap 2.0.

Usage
-----

1. Create the database using the included SQL file.
2. Create the datasource.
3. Make sure you include the lib folder which contains BCrypt.class.

This app uses BCrypt.class for password hashing. It's included in the lib directory. Make sure it's available to the app. If you have problems, check the path to the class in the User.cfc model. BCrypt objects are created in two methods: securePassword() and authenticate().

Note that this version uses a new schema. The old schema is no longer compatible with this version.

You need to setup your email credentials in /config/settings.cfm. The e-mail functionality is commented out at the moment (password update verification).

**Requires ColdFusion 9 or Railo 3+.**


Versioning
----------

I will try to maintain CFW User Manager under the Semantic Versioning guidelines as much as possible (once I've read them, that is).

Releases will be numbered with the follow format:

`<major>.<minor>.<patch>`

Bug tracker
-----------

Please create an issue here on GitHub!

https://github.com/abitdodgy/cfw-usermanager/issues


Author
-------

**Mohamad El-Husseini**

+ http://mohamad.im