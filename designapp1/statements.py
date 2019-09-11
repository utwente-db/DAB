from django.db import connection
import psycopg2 as db
"""
This file contains the ugly part of the program where we insert raw SQL into the database
"""

#Why
host = connection.settings_dict["HOST"]

#Creates a database owned and administered by a user with a password
#Also ensures this database does not have a schema public, but instead has a schema private.
def create_db(db_name, username, password):
	global host
	with connection.cursor() as cursor:
		cursor.execute("CREATE USER %s WITH UNENCRYPTED PASSWORD %s;", [username, password])
		cursor.execute("CREATE DATABASE %s WITH OWNER %s;", [db_name, username])
		cursor.execute("GRANT ALL PRIVILEGES ON DATABASE %s TO %s;", [db_name, username])
		cursor.execute("REVOKE PRIVILEGES ON DATABASE %s FROM public;", [db_name])

		#In order to drop the public schema, we HAVE to connect to the database in question
		#For security&tm; reasons I would like to not use the admin account for this.
		try:
			conn = db.connect("dbname='"+db_name+"' user='"+username+"' host='"+host+"' password='"+password+"'");

			with conn.cursor as cur:
				cur.execute("DROP SCHEMA public CASCADE;")
				cur.execute("CREATE SCHEMA private;")
				cur.execute("ALTER SCHEMA private OWNER TO %s", [username])

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


