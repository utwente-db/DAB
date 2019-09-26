from django.db import connection
import psycopg2 as db
"""
This file contains the ugly part of the program where we insert raw SQL into the database
"""

#for internal use: returns new connection object to other database
def connect(db_name):
	#Why
	db_host = connection.settings_dict["HOST"]
	db_user = connection.settings_dict["USER"]
	db_port = connection.settings_dict["PORT"]
	db_password = connection.settings_dict["PASSWORD"]

	conn = db.connect(user=db_user,
		              password=db_password,
		              host=db_host,
		              port=db_port,
		              database=db_name)

	return conn



#Creates a database owned and administered by a user with a password
#Also ensures this database does not have a schema public, but instead has a schema private.
def create_db(db_name, username, password):
	# TODO @Floris remove global variables here, refactor db.connect bit into a seperate method that accepts db_name as parameter
	global db_host, db_user, db_port, db_password
	with connection.cursor() as cursor:
		#TODO: literally any security of any kind at all
		#(especially preventing injections)
		cursor.execute("CREATE USER \""+username+"\" WITH UNENCRYPTED PASSWORD '"+password+"';")
		cursor.execute("CREATE DATABASE \""+db_name+"\" WITH OWNER \""+username+"\";")
		cursor.execute("GRANT ALL PRIVILEGES ON DATABASE \""+db_name+"\" TO \""+username+"\";")
		cursor.execute("REVOKE ALL PRIVILEGES ON DATABASE \""+db_name+"\" FROM public;")

	#In order to drop the public schema, we HAVE to connect to the database in question
	conn = connect(db_name)

	with conn.cursor() as cur:
		cur.execute("DROP SCHEMA public CASCADE;")
		cur.execute("CREATE SCHEMA private;")
		cur.execute("ALTER SCHEMA private OWNER TO \""+username+"\";")

#Deletes a database
def delete_db(db_name):
	with connection.cursor() as cursor:
		cursor.execute("DROP DATABASE \""+db_name+"\";")

#Deletes a user
def delete_user(username):
	with connection.cursor() as cursor:
		cursor.execute("DROP USER \""+username+"\";")

#Deletes a database and its owner
#WARNING: use only if the user exclusively owns this database
#TODO: enforce the above
def delete_db_with_owner(db_name):
	connection.autocommit = False
	try:
		with connection.cursor() as cursor:
			cursor.execute("SELECT pg_catalog.pg_get_userbyid(d.datdba) as owner FROM pg_catalog.pg_database d WHERE d.datname = %s;", [db_name])
			owner = cursor.fetchone()[0];
			cursor.execute("DROP DATABASE \""+db_name+"\";")
			cursor.execute("DROP USER \""+owner+"\";")
		connection.commit()
	except (Exception, db.Error) as error:
		connection.rollback()
		raise error
	connection.autocommit = True


#Gets a list of all non-super users and their passwords
#WARNING: these passwords are real. Be sure to not make non-superusers with plaintext passwords for other reasons!
def get_users():
	with connection.cursor() as cursor:
		cursor.execute("SELECT usename, passwd FROM pg_catalog.pg_shadow WHERE NOT usesuper;")
		result = []
		for item in cursor.fetchall():
			result.append({"username": item[0], "password": item[1]})
		return result
