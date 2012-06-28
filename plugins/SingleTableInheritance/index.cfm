<h1>Single Table Inheritance 1.1</h1>
<h3>A plugin for <a href="http://cfwheels.org" target="_blank">Coldfusion on Wheels</a> by <a href="http://cfwheels.org/user/profile/24" target="_blank">Andy Bellenie</a></h3>
<p>This plugin allows you to store different model classes in a single database table by using a 'type' column to identify to class. For example, you may have many different types of user, but you want to store them all in one table and share some common functionality.</p>
<h2>Usage</h2>

<p>
1. Add the column to distinguish between different classes to your database table. Depending on your application, this could be a number of different datatypes:<ul>
	<li>bit: ideal when there are only two subclasses (e.g. pages and sections within a CMS, the column could then be called 'isSection' or 'isPage')</li>
	<li>varchar: good for readability (used in the example below)</li>
	<li>integer: better performance for many class types on very high load applications</li>
</ul>
<p>2. Create a standard Wheels base class. For this example, it would be called User.cfc</p>
<pre>
&lt;!--- User.cfc ---&gt;
&lt;cfcomponent extends=&quot;Model&quot;&gt;

&lt;/cfcomponent&gt;
</pre>
<p>3. Create one or more sub-classes that extend the base class, and add a call to the plugin setup function. Remember to add super.init() to your subclass if the parent class also has an init() block.</p>
<pre>
&lt;!--- Administrator.cfc ---&gt;
&lt;cfcomponent extends=&quot;User&quot;&gt;

	&lt;cffunction name=&quot;init&quot;&gt;
		&lt;cfset singleTableInheritance(tableName=&quot;users&quot;)&gt;
	&lt;/cffunction&gt;

&lt;/cfcomponent&gt;
</pre>
<pre>
&lt;!--- Editor.cfc ---&gt;
&lt;cfcomponent extends=&quot;User&quot;&gt;

	&lt;cffunction name=&quot;init&quot;&gt;
		&lt;cfset singleTableInheritance(tableName=&quot;users&quot;)&gt;
	&lt;/cffunction&gt;

&lt;/cfcomponent&gt;</pre>
<p>singleTableInheritance() accepts the following arguments:
<ul>
	<li>tableName (string, required) - the name of the table</li>
	<li>typeColumn (string, defaults to 'type') - the name of the column used to differentiate between different types of models (can be any simple value, a string, integer, bit etc...)</li>
	<li>typeValue (string, defauls to the model name of the sub-class, in this case 'Administrator' or 'Editor')</li>
</ul>
</p>
4. You can now place methods custom to administrators or editors in their model while keeping a single database table. All Wheels ORM functions will operate only on the relevant subclass, e.g.
<ul>
	<li>model(&quot;Administrator&quot;).findAll() - returns all administrators</li>
	<li>model(&quot;User&quot;).findAll() - returns all editors and administrators</li>
	<li>model(&quot;Editor&quot;).deleteAll() - deletes all editors, etc.</li>
</ul>
<h2>Support</h2>
<p>I try to keep my plugins free from bugs and up to date with Wheels releases, but if you encounter a problem please log an issue using the tracker on github, where you can also browse my other plugins.<br />
<a href="https://github.com/andybellenie" target="_blank">https://github.com/andybellenie</a></p>
