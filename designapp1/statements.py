from django.db import connection
import psycopg2 as db
"""
This file contains the ugly part of the program where we insert raw SQL into the database
"""

#Why
db_host = connection.settings_dict["HOST"]
db_user = connection.settings_dict["USER"]
db_port = connection.settings_dict["PORT"]
db_password = connection.settings_dict["PASSWORD"]

#Creates a database owned and administered by a user with a password
#Also ensures this database does not have a schema public, but instead has a schema private.
def create_db(db_name, username, password):
	global db_host, db_user, db_port, db_password
	with connection.cursor() as cursor:
		#TODO: literally any security of any kind at all
		#(especially preventing injections)
		cursor.execute("CREATE USER \""+username+"\" WITH UNENCRYPTED PASSWORD '"+password+"';")
		cursor.execute("CREATE DATABASE \""+db_name+"\" WITH OWNER \""+username+"\";")
		cursor.execute("GRANT ALL PRIVILEGES ON DATABASE \""+db_name+"\" TO \""+username+"\";")
		cursor.execute("REVOKE ALL PRIVILEGES ON DATABASE \""+db_name+"\" FROM public;")

		#In order to drop the public schema, we HAVE to connect to the database in question
		try:
			conn = db.connect(user=db_user,
				              password=db_password,
				              host=db_host,
				              port=db_port,
				              database=db_name)

			with conn.cursor() as cur:
				cur.execute("DROP SCHEMA public CASCADE;")
				cur.execute("CREATE SCHEMA private;")
				cur.execute("ALTER SCHEMA private OWNER TO \""+username+"\";")

		except (Exception, db.Error) as error:
			return "Error: "+str(error)

		return "ok"

#Deletes a database
def delete_db(db_name):
	with connection.cursor() as cursor:
		cursor.execute("DROP DATABASE %s", [db_name])

#Deletes a user
def delete_user(username):
	with connection.cursor() as cursor:
		cursor.execute("DROP USER %s", [username])

#Deletes a database and its owner
#WARNING: use only if the user exclusively owns this database
#TODO: enforce the above
def delete_db_with_owner(db_name):
	connection.set_isolation_level(3)
	with connection.cursor() as cursor:
		cursor.execute("SELECT pg_catalog.pg_get_userbyid(d.datdba) as owner FROM pg_catalog.pg_database d WHERE d.datname = %s;", [db_name])
		owner = cursor.fetchone()[0];
		cursor.execute("DROP USER %s", [owner])
		cursor.execute("DROP DATABASE %s" [db_name])
	connection.commit()
	connection.set_isolation_level(0)


#Gets a list of all non-super users and their passwords
#WARNING: these passwords are real. Be sure to not make non-superusers with plaintext passwords for other reasons!
def get_users():
	with connection.cursor as cursor:
		cursor.execute("SELECT usename as username, passwd as password FROM pg_catalog.pg_shadow WHERE NOT usesuper;")
		return cursor.fetchall()


