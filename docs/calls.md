<h1>Documentation REST calls</h1>

<p>This document gives a complete overview of all the REST calls implemented in the DAB (Database Administration Bundle) application. Every call will start with a /rest/ unless specified otherwise. Depending on the server that DAB is running there will be a hostname before /rest/. To keep this document as general as possible no hostname is included. </p>

<p>Some calls do require some input in the body. When this is not specified the server will ignore any input in the body and thus can be omitted. If however a body is required the body must be of type JSON.</p>

<p>DAB uses 3 different roles to identify privileges for a user. Each role has a specific value. An admin has value 0, a teacher has value 1 and a student has value 2. These values are used in some calls below.</p>

<h2>Responses</h2>

<p>Depending on the call there can be a number of different responses. When an error or successful action occurs the server will give back a HTTP response status code. These codes are listed below.</p>

<h3>In general</h3>

<pre><code>RESPONSE:   Dont touch that:401 [you have no authorisation to do that action]
        Any other case: 405
</code></pre>

<h3>Call specific</h3>

<p>GET</p>

<pre><code>RESPONSE:
	Succes:     data
	Otherwise:  404
</code></pre>

<p>PUT</p>

<pre><code>RESPONSE:
	Sucess:     	202
	bad request:    400 [is the JSON object correct?]
</code></pre>

<p>POST</p>

<pre><code>RESPONSE:
	Succes:     	201
	bad request:    400 [Did you provide the correct fields?]
	DB del err: 	500 [ONLY with studentdatabases-&gt; not good,report]
	duplicate key:  409 [This combination already exsists]
	other db err:   406
</code></pre>

<p>DELETE</p>

<pre><code>RESPONSE:
	Succes:     	202
	Otherwise:  	404 [Probably the pk is not in the db]
	DB del err: 	500 [ONLY with studentdatabases-&gt; not good,report]
	protected db:   409 [deleting a user with existing db&#39;s]
	other db err:   406
</code></pre>

<p>If in any situation a 500 error is returned the server has encountered an internal error. If this occurs, please report this instance to the administrator.</p>


<h2>/set_role</h2>

<h4>CALL: POST</h4>

<p>Sets the role of a user.
Unless one is admin, one can only set the role of someone with a higher role than oneself, and to a role higher to oneself.
So a teacher can create a ta.</p>

<p>Body</p>

<pre><code>body:
   {
   &#34;user&#34;: 3, [USER ID]
   &#34;role&#34;: 0 [ROLE TO BE SET TO]
   }
</code></pre>

<h2>/whoami</h2>

<h4>CALL: GET</h4>

<p>Returns a JSON object with the id, email, and role of the user. Useful for debugging and unit testing.
If the user is not logged in, returns a 401.</p>

<h2>/who</h2>

<h4>CALL: GET</h4>

<p>Same as whoami, but only return id and role.
Because there is no (explicit) database query, this request is a bit faster</p>

<h2>/dump/</h2>

<h4>CALL: GET</h4>

<p>Returns a sql dump of the database corresponding to the specified id.
Note that the content type is application/sql and that most browsers will see it as a file to be downloaded; a simple link with <code>target=&#34;_blank&#34;</code> would suffice for the front-end.</p>

<h2>/reset/</h2>

<h4>CALL: POST</h4>

<p>Resets the table to the original schema from the course.</p>

<h2>/missing_databases</h2>

<h4>CALL: GET</h4>

<p>GET -&gt; A JSON array of databases that the system does not know about, starting with the prefix specified in settings.py</p>

<h2>/missing_databases/all</h2>

<h4>CALL: GET,DELETE</h4>

<p>GET -&gt; a JSON array of ALL databases not managed by DAB</p>
<p>DELETE -&gt; gets a JSON array of database names. DAB will drop all databases in the array, provided they are not managed</p>

<h2>TABLE: studentdatabases</h2>

<h3>/studentdatabases/</h3>

<h4>CALL: GET,POST</h4>

<p>GET -&gt; get info all users</p>
<p>POST    -&gt; add user</p>

<pre><code>body:
    {
    &#34;fid&#34;:&#34;5&#34;, [FOREIGN KEY, MUST EXIST. Optional, if not specified, your current user id]
    &#34;course&#34;:&#34;3&#34;, [FOREIGN KEY, MUST EXIST]
    &#34;groupid&#34;:&#34;4&#34; [FREE TO CHOOSE, responsibility is for the student as he is the person who can change it]
    }
</code></pre>

<p>Note: on success you will get the following object back:</p>

<pre><code>body:
    {
    &#34;dbid&#34;:&lt;GENERATED VALUE, used as primary key&gt;
    &#34;fid&#34;:&lt;your value&gt;
    &#34;course&#34;:&lt;your value&gt;
    &#34;databasename&#34;:&lt;GENERATED VALUE&gt;
    &#34;username&#34;:&lt;GENERATED VALUE (same as databasename)
    &#34;password&#34;:&lt;GENERATED VALUE (long)&gt;
    }
</code></pre>

<p>Note that the student will want to know the generated values</p>

<h3>/studentdatabases/pk</h3>

<h4>CALL: GET,DELETE</h4>

<p>GET -&gt; for that pk</p>
<p>DELETE  -&gt; for that pk</p>

<h3>/studentdatabases/name/value</h3>

<h4>CALL: GET</h4>

<p>GET -&gt; search on the name of the database. The value will be taken as the search field</p>

<h3>/studentdatabases/own/</h3>

<h4>CALL: GET</h4>

<p>GET -&gt; gives back all the studentdatabases owned by the user currently logged in</p>

<h3>/studentdatabases/owner/value</h3>

<h4>CALL: GET</h4>

<p>GET -&gt; gives back all the studentdatabases owned by the user with the id of the value</p>

<h3>/studentdatabases/course/value</h3>

<h4>CALL: GET</h4>

<p>GET -&gt; gives back all the studentdatabases belonging to this specific course</p>

<h3>/studentdatabases/teacher/own</h3>

<h4>CALL: GET</h4>

<p>GET -&gt; gives back all the studentdatabases owned by the teacher</p>

<h2>TABLE: Courses</h2>

<h3>/courses/</h3>

<h4>CALL: GET,POST</h4>

<p>GET -&gt; get all courses</p>
<p>NB: to save data, schemas are not mentioned in GET!</p>
<p>POST    -&gt; add a new course</p>
body:</p>

<pre><code>{
&#34;coursename&#34;:&#34;test20&#34;, [FREE TO CHOOSE]
&#34;students&#34;:&#34;2&#34;, [FREE TO CHOOSE]
&#34;info&#34;:&#34;test200&#34;, [FREE TO CHOOSE]
&#34;fid&#34;:&#34;7&#34; [FOREIGN KEY, MUST EXIST; OPTIONAL, defaults to own]
&#34;schema&#34;: &lt;sql&gt; [OPTIONAL, DEFAULT=&#34;&#34;]
&#34;active&#34;: [BOOLEAN, OPTIONAL, DEFAULT=false]
}
</code></pre>

<h3>/courses/pk</h3>

<h4>CALL: GET,PUT,DELETE</h4>

<p>GET -&gt; get course for this specific course id</p>
<p>PUT -&gt; update information (updating the fid or courseid is not allowed)</p>
<p>DELETE  -&gt; delete a course for a specific course id</p>

<h3>/courses/name/value</h3>

<h4>CALL: GET</h4>

<p>GET -&gt; search for the value field, based on the coursename</p>

<h3>/courses/own/</h3>

<h4>CALL: GET</h4>

<p>GET -&gt; gives back all the courses owned by the currently logged in user</p>

<h3>/courses/pk/schema</h3>

<h4>CALL: GET,POST</h4>

<p>GET -&gt; returns the schema for that database as a sql file</p>
<p>POST -&gt; Takes the <strong>plaintext</strong> body, and makes it the schema of the database (if it passes verification).</p>

<h2>TABLE: dbmusers</h2>

<h3>/dbmusers/</h3>

<h4>CALL: GET,POST</h4>

<p>GET -&gt; get all users</p>
<p>POST    -&gt; add a new user</p>
<p>body:</p>

<pre><code>{
&#34;role&#34;:&#34;0&#34;, [0=admin,1=teacher,2=student] [set to 2 if not included]
&#34;email&#34;:&#34;asdfasdf2&#34;, [FREE TO CHOOSE, THOUGH NO DUPLICATE IN TABLE]
&#34;password&#34;:&#34;test205&#34;, [FREE TO CHOOSE, IS HASHED]
}
</code></pre>

<h3>/dbmusers/pk</h3>

<h4>CALL: GET,DELETE</h4>

<p>GET -&gt; get user for that user id</p>
<p>DELETE  -&gt; delete user for that user id</p>

<h3>/dbmusers/email/value</h3>

<h4>CALL: GET</h4>

<p>GET -&gt; search for the value, based on emailaddress</p>

<h3>/dbmusers/own/</h3>

<h4>CALL: GET</h4>

<p>GET -&gt; gives back the info about the currently logged in user</p>

<h3>/dbmusers/course/value</h3>

<h4>CALL: GET</h4>

<p>GET -&gt; gives back the users that have a database in that course</p>

<h2>TABLE: TAs</h2>

<h3>/tas/</h3>

<h4>CALL: GET,POST</h4>

<p>GET -&gt; get all tas</p>
<p>POST    -&gt; add a new ta</p>
body:</p>

<pre><code>{
&#34;courseid&#34;:&#34;8&#34;,  [FOREIGN KEY, MUST EXIST]
&#34;studentid&#34;:&#34;16&#34; [FOREIGN KEY, MUST EXIST]
}
</code></pre>

<h3>/tas/pk</h3>

<h4>CALL: GET,DELETE</h4>

<p>GET -&gt; get ta for that ta id</p>
DELETE  -&gt; delete ta for that ta id</p>

<h3>/tas/teacher/own/</h3>

<h4>CALL: GET</h4>

<p>GET -&gt; returns all the tas in the courses owned by this teacher</p>

<h3>/tas/own/</h3>

<h4>CALL: GET</h4>

<p>GET -&gt; gives back the ta information about the currently logged in ta</p>

<h3>/tas/course/courseid</h3>

<h4>CALL: GET</h4>

<p>GET -&gt; gives back the tas of that course</p>

<h3>/schematransfer/[course]/[database]</h3>

<h4>CALL: POST</h4>

<p>Transfers the schema from the database to the course.</p>

<p>Only works if the database belongs to the course or to your user personally, unless you are an admin.</p>

<p>Default schema (named after the user) is preserved from the target database</p>

<h3>/generate_migration</h3>

<h4>CALL: POST</h4>

<p>POST -&gt; Generates the backup script. Returns the location of said script.</p>

<p>Only accessible to admins</p>

<h3>/course_dump/courseid</h3>

<h4>CALL: GET</h4>

<p>GET -&gt; returns a zip file with dumps of every database in the course.
Dump filenames are named after the user email.</p>

<p>Accessible to admins and the course owner (NOT TA’s!)</p>

<p>WARNING: May take a long time. Use with caution.</p>

<h3>/request_reset_password/[email] (NOT /rest !!!)</h3>

<h4>CALL: POST</h4>

<p>POST -&gt; Sends an password reset email</p>

<p>Email contains a link that is valid for 4 hours.</p>

<h3>/reset_password/[user id]/[token] (NOT /rest !!!)</h3>

<h4>CALL: GET,POST</h4>

<p>GET -&gt; Displays a “new password” prompt</p>
<p>POST -&gt; Takes in a JSON object with one key, “password”, and sets the password to that password.</p>

<p>Both of these will return errors if the token is invalid or expired.</p>

<p>The link sent will be valid for 4 hours.</p>

<h3>/change_password/ (NOT /rest !!!)</h3>

<h4>CALL: POST</h4>

<p>POST -&gt; Takes in the following JSON</p>

<pre><code>{
&#34;current&#34;: &#34;aoeu&#34;, [CURRENT USER PASSWORD]
&#34;new&#34;: &#34;ueoa&#34; [NEW PASSWORD]
}
</code></pre>

<p>and sets the password of the user to the new password, if the current one is correct.</p>
