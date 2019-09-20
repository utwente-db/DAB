# Documentatie REST calls:

!!!---- When not specified the body can be empty ----!!!

GET -> data if success, 404 otherwise
POST/DELETE -> 200 if success ,404 otherwise

## TABLE: studentdatabases

### /studentdatabases/

GET	-> get info all users
	RESPONSE: 	Succes:		data
			Otherwise: 	404
POST 	-> add user
	RESPONSE: 	Sucess:		201 
			Invalid input:	400 [parser fails to process input]
			DB insert err:	500
	body: 

		{
		"fid":"5", [FOREIGN KEY, MUST EXIST]
		"databasename":"test20", [FREE TO CHOOSE]
		"course":"3", [FOREIGN KEY, MUST EXIST]
		"username":"test20", [FREE TO CHOOSE]
		"password":"test20" [FREE TO CHOOSE]
		}
OTHERWISE
	RESPONSE:	Any case:	405

### /studentdatabases/pk

GET	-> for that pk
	RESPONSE: 	Succes:		data
			Otherwise:	404

DELETE	-> for that pk	
	RESPONSE: 	Succes:		204
			PK not found: 	404 
			DB remove err:	500
OTHERWISE
	RESPONSE:	Any case:	405

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

## TABLE: Roles

### /roles/

GET	-> get all users
POST	-> add a new user
body: 

	{
	"fid":"5", [FOREIGN KEY, MUST EXIST]
	"databasename":"test20", [FREE TO CHOOSE]
	"course":"3", [FOREIGN KEY, MUST EXIST]
	"username":"test20", [FREE TO CHOOSE]
	"password":"test20" [FREE TO CHOOSE]
	}

### /roles/pk

GET	-> get user for that user id
DELETE	-> delete user for that user id

## TABLE: TAs

### /tas/

GET	-> get all tas
POST	-> add a new ta
body: 

	{
	"role":"0", [FREE TO CHOOSE]
	"email":"test@test.com", [FREE TO CHOOSE]
	"password":"3325asdf", [FREE TO CHOOSE]
	"maxdatabases":"4" [FREE TO CHOOSE]
	}

### /tas/pk

	GET	-> get ta for that ta id
	DELETE	-> delete ta for that ta id

