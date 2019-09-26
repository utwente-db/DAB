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

## TABLE: studentdatabases

### /studentdatabases/

GET	-> get info all users
POST 	-> add user
	body:
		{
		"fid":"5", [FOREIGN KEY, MUST EXIST]
		"databasename":"test20", [FREE TO CHOOSE]
		"course":"3", [FOREIGN KEY, MUST EXIST]
		"username":"test20", [FREE TO CHOOSE]
		"password":"test20", [FREE TO CHOOSE]
		"schema":"1"[FOREIGN KEY, MUST EXIST]
		}
NOTE: DO NOT START A DATABASENAME WITH A NUMBER, IT WILL FAIL

### /studentdatabases/pk

GET	-> for that pk
DELETE	-> for that pk


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
