ColdFusion on Wheels User Manager Demo
======================================

User Manager is a demo app for ColdFusion on Wheels. It's meant to be a toolkit for learning or kickstarting a project that requires session management and authorization functionality.


Current Version 2.0
-------------------

Current version includes the following functionality:

* Registration;
* Authentication;
* CRUD functionality for User model;
* Password hashing and salting;
* Expiring password resets with confirmation e-mail;
* Admin authorization;
* Admin CRUD for managing users (work in progress).


Change Log
----------

The following changes have been made in version 2.0:

* New RESTful Sessions controller.
* New RESTful password resets controller.
* No longer using a separate table to store password reset tokens. Password reset tokens are now stored in their own column in the users table. The previous release complicated things needlessly.
* Removed account verification. Will add this at a later stage.
* Change database schema: dropped the tokens and roles tables.
* Massive refactoring.

Coming Soon
-----------

* Account verification.
* Friendly redirects.

Usage
-----

Note that this version uses a new schema. The old schema is no longer compatible with this version.

Download and run the included SQL file to create the database.

You will also need to setup your email credentials in /config/settings.cfm. The e-mail functionality is commented out at the moment.

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