# The authentication system

We use a self-made authentication system. This has the advantages of having more control over our data, which, given the extent to which we need to link user accounts to other parts of the database, is rather useful.
Furthermore, it allows for extremely fine-grained permission settings, although it may be a bit more work to implement.
Our system has 4 roles, identified by an integer, where the lower numbers mean **more** permissions.
These roles are as follows:

- 0: admin. capable of doing pretty much everything
- 1: teacher. capable of making courses and doing anything within those courses, but not capable of interfering with other teachers courses.
- 2: ta. capable of seeing things within courses, but not edit any data
- 3: student. capable of requesting databases within a course, but no more than that.

A teacher may promote students to admin, but an admin must promote people to teacher.

## Calls

The login information is stored in the session cookie.
This cookie allows for the storage of information between requests from the same browser, without malicious agents being able to manipulate this information.
Regular REST calls will know if the cookie is present, as it is also sent with JavaScript XHR. 
Keep in mind that most if not all REST calls will return a 401 if the user is not logged in.

### Login

To log in, send a POST form to `/login` containing the following data:

- "mail": the users e-mail address, used as a user id
- "password": the users password. Note that in production, an SSL certificate must and will be used

If login is succesful, the user will be redirected to the index page.
If unsuccesful, they will be redirected to the login page over GET, which contains a form with this data.
Because the login was unsuccesful, a message saying "no such user/password combination found". 
For security reasons it's important this message be the same, no matter if there was no user found by that email or whether a user was found, but the password was incorrect.

### Logout

To logout, a empty POST request must be sent to `/logout`. 
This will flush the users session, clearing all their login credentials.

### Register

To register a new account, one must send a POST form containing the following information:

- "mail": the user's email
- "password": the user's password
- "passwordConfirm": the user's password again, to make sure they didn't get it wrong. This might be removed in a future version in favour of letting the front-end handle it entirely.

Doing so will create a user with role=3, or student.
For information on how to change the role of a student, see calls.md/set_role

## Checking Permissions

If a user is logged in, their session will contain two variables:

- "user": the users id, or the primary key in the `roles` database
- "role": the role of the user

It is possible to check these manually, but this is not recommended.

`views.py` contains a function `check_role`, which takes in the request object and a role, and will return a boolean `True` if the user has a role equal to or smaller then the desired role.

Note that even if you don't care about the role, but only about the user id, it is still highly recommended to perform this role check; if the session cookie is not set checking it's contents will result in a `KeyError`, and `check_role` accounts for this.
