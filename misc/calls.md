# Documentatie REST calls:

!!!---- When not specified the body can be empty ----!!!

IN GENERAL IF YOU GET A 500 ERROR -> YOU FIND A BUG, PLEASE REPORT

GET
	RESPONSE: 	Succes:		data
			Otherwise: 	404
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
- role: the role the user should be set to
- user: the users email. Possibly change to user id?

returns: 
- 200 if succesful
- 401 if user does not have permission
- 404 if the user that should be modified does not exist, or already has too low of a role.

## /whoami

Returns a JSON object with the id, email, and role of the user. Useful for debugging and unit testing.
If the user is not logged in, returns a 404.

## /dump/<pk>

Returns a sql dump of the database corresponding to the specified id.
Note that the content type is application/sql and that most browsers will see it as a file to be downloaded; a simple link with `target="_blank"` would suffice for the front-end.

Only accepts get.
Permissions:

Teachers and above: allowed for any.
Students: allowed their own.

## TABLE: studentdatabases

### /studentdatabases/

GET	-> get info all users
POST 	-> add user

	body: 
		{
		"fid":"5", [FOREIGN KEY, MUST EXIST. Optional, if not specified, your current user id]
		"course":"3", [FOREIGN KEY, MUST EXIST]
		"schema":"1"[FOREIGN KEY, MUST EXIST]
		}

Note: on success you will get the following object back:

	body:
		{
		"fid":<your value>
		"course":<your value>
		"schema":<your value>
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

## TABLE: Courses

### /courses/

GET	-> get all courses
POST	-> add a new course
body: 

	{
	"coursename":"test20", [FREE TO CHOOSE]
	"students":"2", [FREE TO CHOOSE]
	"info":"test200", [FREE TO CHOOSE]
	"fid":"7" [FOREIGN KEY, MUST EXIST]
	}

### /courses/pk

GET	-> get course for that course id
DELETE	-> delete course for that course id

### /courses/name/value

GET -> search for the value, based on the coursename

## TABLE: dbmusers

### /dbmusers/

GET	-> get all users
POST	-> add a new user
body: 
	{
	"role":"0", [0=admin,1=teacher,2=student]
	"email":"asdfasdf2", [FREE TO CHOOSE, THOUGH NO DUPLICATE IN TABLE]
	"password":"test205", [FREE TO CHOOSE, IS HASHED]
	"maxdatabases":"2" [FREE TO CHOOSE]
	}

### /dbmusers/pk

GET	-> get user for that user id
DELETE	-> delete user for that user id

### /dbmusers/email/value

GET -> search for the value, based on emailaddress

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

## TABLE: Schemas

### /schemas/

GET	-> get all schemas
POST	-> add a new schema
body: 
	{
	"name":"test325",  [FREE TO CHOOSE]
	"course":"16", [FOREIGN KEY, MUST EXISTS]
	"sql":"sql part" [FREE TO CHOOSE, BUT MUST BE SQL ]	
  	}

### /schemas/pk

GET	-> get schemas for that schemaid
DELETE	-> delete schema for that schemaid

### /schemas/name/value

GET -> search for the value, based on the schema name

# Permissions

Each user level has the following permissions

|               | Schemas       | Tas           | dbmusers      | Courses      | Studentdatabases |
|---------------|---------------|---------------|---------------|--------------|------------------|
| Admin         | Get, all      | Get, all      | Get, all      | Get, all     | Get, all         |
|               | Get, any      | Get, any      | Get, any      | Get, any     | Get, any         |
|               | POST          | POST          | POST          | POST         | POST             |
|               | DELETE, any   | DELETE, any   | DELETE, any   | DELETE, any  | DELETE, any      |
|---------------|---------------|---------------|---------------|--------------|------------------|
| Teacher       | Get, all      | Get, all      | Get, all      | Get, all     | Get, all         |
|               | Get, any      | Get, any      | Get, any      | Get, any     | Get, any         |
|               | POST          | POST          | POST          | POST         | POST             |
|---------------|---------------|---------------|---------------|--------------|------------------|
| Student       | GET, all      | Get, own      | Get, own      | Get, all     | Get, own         |
|               | Get, any      |               | POST          | Get, any     | POST             |
|---------------|---------------|---------------|---------------|--------------|------------------|
| Not logged in |               |               | POST          |              |                  |
