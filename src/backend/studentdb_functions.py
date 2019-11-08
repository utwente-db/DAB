import logging

import psycopg2 as db
from django.db import connection
from django.db import transaction
from psycopg2.extensions import AsIs

from src.django_settings.settings import STUDENT_DB_PREFIX
from . import models
from .schemas import write as writeSchema

logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s %(levelname)s %(message)s',
)

    
def connect(db_name):
    """Connect to a database

    :param db_name: the database to connect to
    :type db_name: string
    :returns: the database connection
    :type: psycopg2.connection
    """
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


# https://stackoverflow.com/questions/1598932/atomic-increment-of-a-counter-in-django
    
@transaction.atomic
    
def get_studentdatabase_name(courseid):
    """Get the name of a database in a course, which is the course name followed by an integer

    :param courseid: The ID of the course to put the database in
    :type courseid: int
    :returns: the database name
    :rtype: string
    """
    course = models.Courses.objects.select_for_update().get(courseid=courseid)
    username = STUDENT_DB_PREFIX + course.coursename + "_" + str(course.databases)
    course.databases += 1
    course.save()

    return username


    
def reset_studentdatabase(db):
    """Reset a database to the schema of it's course

    :param db: The database to reset
    :type db: .models.Studentdatabases
    :returns: None
    """
    with connection.cursor() as cursor:
        connection.autocommit = False
        # make sure no one can connect to the database
        cursor.execute("UPDATE pg_database SET datallowconn = 'false' WHERE datname = '%s'",
                       [AsIs(db.databasename)])
        # drop any existing connections
        cursor.execute("SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '%s'",
                       [AsIs(db.databasename)])
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
        writeSchema(db.__dict__, schema)

    
def delete_studentdatabase(databasename, username):
    """Delete a student database

    :param databasename: the name of the database to delete
    :type databasename: string
    :param username: the postgres user corresponding to the database
    :type username: string
    :returns: None
    """
    with connection.cursor() as cursor:
        connection.autocommit = False  # want to make sure we can't be outrun
        # make sure no one can connect to the database
        cursor.execute("UPDATE pg_database SET datallowconn = 'false' WHERE datname = '%s'",
                       [AsIs(databasename)])
        # drop any existing connections
        cursor.execute("SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '%s'",
                       [AsIs(databasename)])
        # actually drop the database
        cursor.execute("DROP DATABASE \"%s\";", [AsIs(databasename)])
        # kick out the user just to be sure
        cursor.execute("SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE usename = '%s'",
                       [AsIs(username)])
        # Drop the user
        cursor.execute("DROP USER \"%s\";", [AsIs(username)])
        connection.commit()
        connection.autocommit = True

    
def create_studentdatabase(db_name, username, password):
    """Make a student database. Does not alter the master database, just creates the database in postgres.

    :param db_name: the name of the database to create
    :type db_name: string
    :param username: the name of the user to be used for the database
    :type username: string
    :param password: the password for the database user
    :type password: string
    :returns: None
    """
    with connection.cursor() as cursor:
        cursor.execute("CREATE USER \"%s\" WITH ENCRYPTED PASSWORD '%s';", [AsIs(username), AsIs(password)])
        cursor.execute("CREATE DATABASE \"%s\" WITH OWNER \"%s\";", [AsIs(db_name), AsIs(username)])
        cursor.execute("GRANT ALL PRIVILEGES ON DATABASE \"%s\" TO \"%s\";", [AsIs(db_name), AsIs(username)])
        cursor.execute("REVOKE ALL PRIVILEGES ON DATABASE \"%s\" FROM public;", [AsIs(db_name)])

        conn = connect(db_name)

        with conn.cursor() as cur:
            cur.execute("DROP SCHEMA public CASCADE;")
            cur.execute("CREATE SCHEMA \"%s\";", [AsIs(username)])
            cur.execute("ALTER SCHEMA \"%s\" OWNER TO \"%s\";", [AsIs(username), AsIs(username)])
        conn.commit()

    
def setup_student_db(databases, serializer_class):
    """Perform the first-time setup actions for a student database to be created

    :param databases: the database to be set up
    :type databases: dict
    :serializer_class: the serializer of the database
    :type serializer_class: .serializers.StudentdatabasesSerializer
    """
    course = serializer_class.validated_data["course"]
    writeSchema(databases, course.schema)
