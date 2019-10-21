# Documentatie REST calls:

!!!---- When not specified the body can be empty ----!!!

IN GENERAL IF YOU GET A 500 ERROR -> YOU FIND A BUG, PLEASE REPORT

GET
	RESPONSE: 	Succes:		data
			Otherwise: 	404
PUT 
    RESPOSNE:   Sucess:     202
            bad request:    400 [is the JSON object correct?]
POST
	RESPONSE: 	Succes:		201
			bad request: 	400 [Did you provide the correct fields?]
			DB del err:	500 [ONLY with studentdatabases-> not good,report]
			duplicate key:	409 [This combination already exsists]
			other db err:	406
DELETE
	RESPONSE: 	Succes:		202
			Otherwise: 	404 [Probably the pk is not in the db]
			DB del err:	500 [ONLY with studentdatabases-> not good,report]
			protected db:	409 [deleting a user with existing db's]
			other db err:	406

OTHERWISE [ALSO (e.g.) when trying to post on a particular pk]
	RESPONSE:	Dont touch that:401 [you have no authorisation to do that action]
			Any other case:	405

## /set_role

Sets the role of a user.
Note that unless one is admin, one can only set the role of someone with a higher role than oneself, and to a role higher to oneself.
So a teacher can create ta's and that's about it.

Method: POST
Body: JSON, containing:

    body:
       {
       "user": 3, [USER ID]
       "role": 0 [ROLE TO BE SET TO]
       }

returns:
- 200 if successful
- 401 if user does not have permission
- 404 if the user that should be modified does not exist, or already has too low of a role.

## /whoami

Returns a JSON object with the id, email, and role of the user. Useful for debugging and unit testing.
If the user is not logged in, returns a 401.

## /dump/<pk>

Returns a sql dump of the database corresponding to the specified id.
Note that the content type is application/sql and that most browsers will see it as a file to be downloaded; a simple link with `target="_blank"` would suffice for the front-end.

Only accepts get.
Permissions:

Teachers and above: allowed for any.
Students: allowed their own.

## /reset/<pk>

Resets the table to the original schema from the course.

Only accepts post
Permissions same as DELETE for database

## TABLE: studentdatabases

### /studentdatabases/

GET	-> get info all users
POST 	-> add user

	body:
		{
		"fid":"5", [FOREIGN KEY, MUST EXIST. Optional, if not specified, your current user id]
		"course":"3", [FOREIGN KEY, MUST EXIST]
        "groupid":"4" [FREE TO CHOOSE, responsibility is for the student as he is the person who can change it]
		}

Note: on success you will get the following object back:

	body:
		{
		"dbid":<GENERATED VALUE, used as primary key>
		"fid":<your value>
		"course":<your value>
		"databasename":<GENERATED VALUE>
		"username":<GENERATED VALUE (same as databasename)
		"password":<GENERATED VALUE (long)>
		}

Note that the student will want to know the generated values

### /studentdatabases/pk

GET	-> for that pk
DELETE	-> for that pk

### /studentdatabases/name/value

GET -> search for the value, based on the studentdatabasename

### /studentdatabases/own/

GET -> gives back all the studentdatabases owned by the user currently logged in

### /studentdatabases/owner/value

GET -> gives back all the studentdatabases owned by the user with the id of the value

Only accessible to admins

### /studentdatabases/course/value

GET -> gives back all teh studentdatabases belonging to the course.

Only accessible to admins and the owners of said course

## TABLE: Courses

### /courses/

GET	-> get all courses
NB: to save data, schemas are not mentioned in GET!
POST	-> add a new course
body:

	{
	"coursename":"test20", [FREE TO CHOOSE]
	"students":"2", [FREE TO CHOOSE]
	"info":"test200", [FREE TO CHOOSE]
	"fid":"7" [FOREIGN KEY, MUST EXIST; OPTIONAL, defaults to own]
	"schema": <sql> [OPTIONAL, DEFAULT=""]
	"active": [BOOLEAN, OPTIONAL, DEFAULT=false]
	}

NB: Schemas are verified for properties such as assigning ownership and creating schemas.
This code is not very well tested; if you ever encounter an error that relates to it, please notify Floris immediately

### /courses/pk

GET	-> get course for that course id
PUT -> update information (updating the fid or courseid is not allowed)
DELETE	-> delete course for that course id

### /courses/name/value

GET -> search for the value, based on the coursename

### /courses/own/

GET -> gives back all the courses owned by the user currently logged in

### /courses/<pk>/schema

GET -> returns the schema for that database as a sql file
POST -> Takes the **plaintext** body, and makes it the schema of the database (if it passes verification).

## TABLE: dbmusers

### /dbmusers/

GET	-> get all users
POST	-> add a new user
body:
	{
	"role":"0", [0=admin,1=teacher,2=student] [set to 2 if not included]
	"email":"asdfasdf2", [FREE TO CHOOSE, THOUGH NO DUPLICATE IN TABLE]
	"password":"test205", [FREE TO CHOOSE, IS HASHED]
	}

### /dbmusers/pk

GET	-> get user for that user id
DELETE	-> delete user for that user id

### /dbmusers/email/value

GET -> search for the value, based on emailaddress

### /dbmusers/own/

GET -> gives back the info about the currently logged in user

### /dbmusers/course/value

GET -> gives back the users that have a database in that course

## TABLE: TAs

### /tas/

GET	-> get all tas
POST	-> add a new ta
body:

	{
	"courseid":"8",  [FOREIGN KEY, MUST EXIST]
	"studentid":"16" [FOREIGN KEY, MUST EXIST]
	}

### /tas/pk

GET	-> get ta for that ta id
DELETE	-> delete ta for that ta id

### /tas/name/value

-----!!!!!NOT IMPLEMENTED YET!!!!!------

### /tas/teacher/own/

GET -> only for the teacher (or admin if it owns courses) returned all the tas in the courses made by this teacher

### /tas/own/

GET -> gives back the ta information about the currently logged in ta

### /tas/course/courseid

GET -> gives back the tas of that course
accesible to the teacher and tas of that course

## /schematransfer/[course]/[database]

Transfers the schema from the database to the course. 

Only works if the database belongs to the course or to your user personally, unless you are an admin.

Default schema (named after the user) is preserved from the target database

## /generate_migration

POST -> Generates the backup script. Returns the location of said script.

Only accessible to admins

## /course_dump/courseid

GET -> returns a zip file with dumps of every database in the course.
Dump filenames are named after the user email.

Accessible to admins and the course owner (NOT TA's!)

WARNING: May take a long time. Use with caution.

## /request_reset_password/[email] \(NOT /rest !!!)

POST -> Sends an password reset email

Email contains a link that is valid for 4 hours.

## /reset_password/[user id]/[token] \(NOT /rest !!!)

GET -> Displays a "new password" prompt //TODO
POST -> Takes in a JSON object with one key, "password", and sets the password to that password.

Both of these will return errors if the token is invalid or expired.

The link sent will be valid for 4 hours.

## /change_password/ (NOT /rest !!!)

POST -> Takes in the following JSON

    {
    "current": "aoeu", [CURRENT USER PASSWORD]
    "new": "ueoa" [NEW PASSWORD]
    }

and sets the password of the user to the new password, if the current one is correct.

# Permissions

Each user level has the following permissions

|               | Tas           | dbmusers      | Courses      | Studentdatabases |
|---------------|---------------|---------------|--------------|------------------|
| Admin         | Get, all      | Get, all      | Get, all     | Get, all         |
|               | Get, any      | Get, any      | Get, any     | Get, any         |
|               | POST          | POST          | POST         | POST             |
|               | DELETE, any   | DELETE, any   | DELETE, any  | DELETE, any      |
|---------------|---------------|---------------|--------------|------------------|
| Teacher       | Get, all      | Get, all      | Get, all     | Get, all         |
|               | Get, any      | Get, any      | Get, any     | Get, any         |
|               | POST          | POST          | POST         | POST             |
|               | Delete, own*  | Delete, own   | Delete, own  | Delete, own      |
|---------------|---------------|---------------|--------------|------------------|
| Student       | Get, own      | Get, own      | Get, all     | Get, own         |
|               |               | POST          | Get, any     | POST             |
|               |               | Delete, own   |              | Delete, own      |
|---------------|---------------|---------------|--------------|------------------|
| Not logged in |               | POST          |              |                  |

\*own here refers to ta's added to courses owned by the teacher

NB: dump has the same permissions as GET for that database, and /reset the same as DELETE
