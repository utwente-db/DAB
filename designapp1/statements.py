from django.db import connection
import psycopg2 as db
"""
This file contains the ugly part of the program where we insert raw SQL into the database
"""

#Why
host = connection.settings_dict["HOST"]

def create_db(db_name, username, password):
	global host
	with connection.cursor() as cursor:
		cursor.execute("CREATE USER %s WITH UNENCRYPTED PASSWORD %s;", [username, password])
		cursor.execute("CREATE DATABASE %s WITH OWNER %s;", [db_name, username])
		cursor.execute("GRANT ALL PRIVILEGES ON DATABASE %s TO %s;", [db_name, username])
		cursor.execute("REVOKE PRIVILEGES ON DATABASE %s FROM public;", [db_name])

		try:
			conn = db.connect("dbname='"+db_name+"' user='"+username+"' host='"+host+"' password='"+password+"'");

			with conn.cursor as cur:
				cur.execute("DROP SCHEMA public;")
				cur.execute("CREATE SCHEMA private;")
				cur.execute("ALTER SCHEMA private OWNER TO %s", [username])


