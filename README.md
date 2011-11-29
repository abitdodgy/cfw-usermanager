COLDFUSION ON WHEELS USER MANAGER DEMO
======================================

CFW User Manager is a demo app for ColdFusion one Wheels. It's meant to be a toolkit for kickstarting a project that requires session management, password reset, and user and management functionality.


Current Version
---------------

Current version includes the following functionality:

* User registration with verification e-mail;
* User authentication
* Update functionality for user profile, email address, and password with verification;
* Password hashing and salting on creation, update, and reset;
* Confirmation e-mail is sent to confirm password reset requests;
* Confirmation e-mail is sent to confirm e-mail update requests;
* Expiring security token functionality for password/e-mail updates resets;
* Admin section for managing users.


Coming Soon
-----------

I will add the following features in later versions.

* Ability to force password update after reset. Currently users are redirect to the update form, but there's nothing stopping them from navigating away;
* User role based security.

Usage
-----

Download and file and run the included SQL file to create the database.

You need to create the schema from the included SQL file. You will also need to setup your email credentials in /config/settings.cfm. The e-mail functionality is commented out at the moment.

**Requires ColdFusion 9+ or Railo 3+.**


Versioning
----------

I'm not really sure how, but I will try to maintain CFW User Manager under the Semantic Versioning guidelines as much as possible (once I've read them, that is).

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