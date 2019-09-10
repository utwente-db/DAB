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
