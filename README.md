ColdFusion on Wheels User Manager Demo
======================================

CFW User Manager is a demo app for ColdFusion on Wheels. It's meant to be a toolkit for learning or kickstarting a project that requires basic session management and authorization, as well as basic CRUD.

Current Version 2.3.0
---------------------

Current version includes the following functionality:

* User registration
* Authentication and authorization
* Basic CRUD for User model
* Password hashing and salting using bCrypt
* Expiring password resets
* Email confirmation
* Basic admin CRUD
* Friendly redirects

Change Log
----------

**Version 2.3.0**
* Added some flash messages to `redirectIfLoggedIn()` and `isAuthorized()` methods.
* Simplified authentication logic in the sessions controller.
* Changed bCyrpt object creation to dynamically detect server type. Suggested by [James Harvey](https://github.com/webdevsourcerer).
* Removed `IsapiRewrite4.ini` and `web.config` to reduce clutter. If you use IIS, you may want to add either one depending on your version. Grab them from CFWheels repo.
* Fixed typo in `Users.cfc` filters arguments. [Adam Chapman](https://github.com/chapmandu)

**Version 2.2.0**

The following are the most recent changes. For a full list of changes, please see the
[change log](https://github.com/abitdodgy/cfw-usermanager/wiki/Change-Log)

This version requires a new SQL file (included). The following changes have been made:

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
* Upgrade to CFWheels 1.2.

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

Add BCrypt.class to ColdFusion Admin. In previous versions you needed to edit `User.cfc` to remove the third argument from any calls to `CreateObject()` as it was Railo specific. Since version 2.2.3 this is no longer necessary; the app will detect your server automatically and create the object correctly.

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