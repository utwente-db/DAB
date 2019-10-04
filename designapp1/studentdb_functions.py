import logging

import psycopg2 as db
from django.db import connection
from psycopg2.extensions import AsIs
from . import models

from . import schemas as schemaWriter

logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s %(levelname)s %(message)s',
)


def connect(db_name):
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

def reset_studentdatabase(db):
    with connection.cursor() as cursor:
        connection.autocommit = False
        cursor.execute("DROP DATABASE \"%s\";", [AsIs(db.databasename)])
        cursor.execute("CREATE DATABASE \"%s\" WITH OWNER \"%s\";", [AsIs(db.databasename), AsIs(db.username)])
        cursor.execute("GRANT ALL PRIVILEGES ON DATABASE \"%s\" TO \"%s\";", [AsIs(db.databasename), AsIs(db.username)])
        cursor.execute("REVOKE ALL PRIVILEGES ON DATABASE \"%s\" FROM public;", [AsIs(db.databasename)])
        connection.commit()
        conn = connect(db.databasename)
        conn.autocommit = False

        with conn.cursor() as cur:
            cur.execute("DROP SCHEMA public CASCADE;")
            cur.execute("CREATE SCHEMA \"%s\";", [AsIs(db.username)])
            cur.execute("ALTER SCHEMA \"%s\" OWNER TO \"%s\";", [AsIs(db.username), AsIs(db.username)])
        conn.commit()
        connection.autocommit = True

        schema = db.course.schema
        schemaWriter.write(db.__dict__, schema)


def delete_studentdatabase(db_name):
    with connection.cursor() as cursor:
        connection.autocommit = False  # want to make sure we can't be outrun
        # make sure no one can connect to the database
        cursor.execute("UPDATE pg_database SET datallowconn = 'false' WHERE datname = '%s'",
                       [AsIs(db_name.databasename)])
        # drop any existing connections
        cursor.execute("SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '%s'",
                       [AsIs(db_name.databasename)])
        # actually drop the database
        cursor.execute("DROP DATABASE \"%s\";", [AsIs(db_name.databasename)])
        # kick out the user just to be sure
        cursor.execute("SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE usename = '%s'",
                       [AsIs(db_name.username)])
        # Drop the user
        cursor.execute("DROP USER \"%s\";", [AsIs(db_name.username)])
        connection.commit()
        connection.autocommit = True


def create_studentdatabase(serializer_class):
    db_name = serializer_class.validated_data['databasename']
    username = serializer_class.validated_data['username']
    password = serializer_class.validated_data['password']
    course = serializer_class.validated_data['course']


    with connection.cursor() as cursor:
        cursor.execute("CREATE USER \"%s\" WITH UNENCRYPTED PASSWORD '%s';", [AsIs(username), AsIs(password)])
        cursor.execute("CREATE DATABASE \"%s\" WITH OWNER \"%s\";", [AsIs(db_name), AsIs(username)])
        cursor.execute("GRANT ALL PRIVILEGES ON DATABASE \"%s\" TO \"%s\";", [AsIs(db_name), AsIs(username)])
        cursor.execute("REVOKE ALL PRIVILEGES ON DATABASE \"%s\" FROM public;", [AsIs(db_name)])

        conn = connect(db_name)

        with conn.cursor() as cur:
            cur.execute("DROP SCHEMA public CASCADE;")
            cur.execute("CREATE SCHEMA \"%s\";", [AsIs(username)])
            cur.execute("ALTER SCHEMA \"%s\" OWNER TO \"%s\";", [AsIs(username), AsIs(username)])
        conn.commit()
    return serializer_class


def setup_student_db(databases, serializer_class):
    course = serializer_class.validated_data["course"]
    schemaWriter.write(databases, course.schema)
