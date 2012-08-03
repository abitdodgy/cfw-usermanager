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

The following are the most recent changes. For a full list of changes, please see the 
[change log](https://github.com/abitdodgy/cfw-usermanager/wiki/Change-Log)

This version requires a new SQL file (included). The following changes have been made:

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

[Change Log](https://github.com/abitdodgy/cfw-usermanager/wiki/Change-Log)

Coming Soon
-----------

* Update to Bootstrap 2.0.
* Remember-me login.

Usage
-----

1. Create the database using the included SQL file.
2. Add the datasource in ColdFusion Admin or Railo.
3. This app uses `BCrypt.class` for password hashing. It's included in the `/lib` directory. Make sure it's available to the app. Depending on what you are using (Railo or ColdFusion), see instructions below.
4. Setup your email credentials in `/config/settings.cfm`. The e-mail functionality is commented out at the moment (optional).

**Railo Users**

Make sure you include the `/lib` folder, which contains `BCrypt.class`. BCrypt.class is needed for password encryption. The path is specified in `User.cfc` where we create our Java objects. For example:

    CreateObject('java','BCrypt.class','/lib')

**ColdFusion Users**

After adding BCrypt.class to ColdFusion Admin, edit `User.cfc` to remove the third argument from any calls to `CreateObject()`. For example:

    CreateObject('java','bCrypt')

The third argument, which is the path to the class file, is Railo specific, and causes an error in ColdFusion if left unchanged. There should be two locations to edit as of version 2.2.0.

Note that version 2.2.0 uses a new schema. The old schema is no longer compatible with this version.

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