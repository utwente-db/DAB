# Description of the REST calls.

NB: all of these require the user to be authenticated; make sure to always check!

## Retrieval, via GET

NB: make sure it's not cached for too long

- Get credentials for database 
- Get list of databases
- Get list of users
- Get list of students
- Get info on database
- Get info on user
- Get info on student
- See log of things that have been done

## Configuration, via POST

- Upload Schema 
- (somehow) upload student configuration
- Create database.
- Create user for database.
- Grant privileges to user for database.
- Create database, user for database, and grant user access
- Do the above for each group in a configured student set, also known as a batch
- Change the password for a user
- Remove priviliges from a user
- Delete a database
- Delete a user
- Delete a batch of databases and users

# Currently available calls

## /get_users

Method: GET
Body: none
Returns: a JSON array of usernames and passwords, representing the currently present database users and their passwords

## /create_db

creates a new database and a new user to own it. 
Ensures permissions on this database are correct

Method: POST
Body: JSON, containing:
- name: the name of the database
- owner: the name of the user that owns it
- password: the password of the user
Returns: Status codes

## /delete_db

Deletes database

Method: POST
Body: JSON, containing:
- name: the name of the database
Returns: Status codes

## /delete_user

Deletes user. Warning: does not work if user still owns a database!

Method: POST
Body: JSON, containing:
- name: the name of the user
Returns: status codes

## /delete_db_with_owner

Deletes database and owner of said database. Owner does not get removed if he still owns other databases.

Method: POST
Body: JSON, containing: 
- name: the name of the database
Returns: status codes

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