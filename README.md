COLDFUSION ON WHEELS USER MANAGER DEMO
======================================

CFW User Manager is a demo app for ColdFusion one Wheels. It's meant to be a toolkit for kickstarting a project that requires session management, password reset, and user and management functionality.


Current Version
---------------

Current version includes the following functionality:

* User registration with validation;
* User authentication
* Update functionality for user profile, email address, and password;
* Password hashing and salting on creation, update, and reset;
* Confirmation e-mail is sent to confirm password reset requests;
* Expiring security token functionality for password resets.


Coming Soon
-----------

I will add the following features in later versions.

* Ability to force password update after reset. Currently users are redirect to the update form, but there's nothing stopping them from navigating away. This will require them to initiate the rest process again if their session ends;
* Administrative tools/user management section;
* User role based security.
* Tests.


Usage
-----

Download and file and run the included SQL file to create the database. Currently the admin functionality is not working, but the user roles table is included never the less.

You need to create the schema from the included SQL file. You will also need to setup your email credentials in /config/settings.cfm.

**Requires ColdFusion 9+ or Railo 3+.**


Versioning
----------

I'm not really sure how, but I will try to maintain CFW User Manager under the Semantic Versioning guidelines as much as possible (once I've read them, that is).

Releases will be numbered with the follow format:

`<major>.<minor>.<patch>`

And constructed with the following guidelines:

* Breaking backwards compatibility bumps the major
* New additions without breaking backwards compatibility bumps the minor
* Bug fixes and misc changes bump the patch


Bug tracker
-----------

Please create an issue here on GitHub!

https://github.com/abitdodgy/cfw-usermanager/issues


Author
-------

**Mohamad El-Husseini**

+ http://mohamad.im


Copyright and license
---------------------

Copyright 2011 Mohamad El-Husseini.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this work except in compliance with the License.
You may obtain a copy of the License in the LICENSE file, or at:

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.