import os
import re
import subprocess

from django.db import connection
from psycopg2.extensions import AsIs
import psycopg2
from . import hash

db_host = connection.settings_dict["HOST"]
db_port = connection.settings_dict["PORT"]

"""Checks if the schema contains anything you might not want in a schema.
Returns a tuple of whether it passed or not, and the reason why as a string"""


def check(schema):
    #create new random database with student privileges
    username, password = hash.randomNames()
    create_db(username, password)
    #attempt to put schema into said database
    os.environ["PGPASSWORD"] = password
    process = subprocess.run(
        ["psql", "-h", db_host, "-U", username, "-p", db_port, "-1", username],
        input=schema, encoding="ascii", stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    err = stderr(process.stderr)
    if err != None:
        delete_db(username)
        return (False, err)

    conn = psycopg2.connect(
        user = username,
        password = password,
        host=db_host,
        port=db_port,
        database=username
        )

    with conn.cursor() as cur:
        # http://cully.biz/2013/12/11/postgresql-getting-the-owner-of-tables/
        cur.execute("SELECT t.table_name, t.table_type, u.usename FROM information_schema.tables t JOIN pg_catalog.pg_class c ON (t.table_name = c.relname) JOIN pg_catalog.pg_user u ON (c.relowner = u.usesysid) WHERE not usename='postgres';")
        result = cur.fetchall()
        for row in result:
            if(row[2] != username):
                delete_db(username)
                return (False, "Owner of "+row[0]+" (a "+row[1]+") is not the student, but "+row[2])

    delete_db(username)
    return (True, "");

def connect(db_name):
    db_user = connection.settings_dict["USER"]
    db_password = connection.settings_dict["PASSWORD"]

    conn = psycopg2.connect(user=db_user,
                      password=db_password,
                      host=db_host,
                      port=db_port,
                      database=db_name)

    return conn

def create_db(username, password):
     with connection.cursor() as cursor:
        cursor.execute("CREATE USER \"%s\" WITH UNENCRYPTED PASSWORD '%s';", [AsIs(username), AsIs(password)])
        cursor.execute("CREATE DATABASE \"%s\" WITH OWNER \"%s\";", [AsIs(username), AsIs(username)])
        cursor.execute("GRANT ALL PRIVILEGES ON DATABASE \"%s\" TO \"%s\";", [AsIs(username), AsIs(username)])
        cursor.execute("REVOKE ALL PRIVILEGES ON DATABASE \"%s\" FROM public;", [AsIs(username)])

        conn = connect(username)
        conn.autocommit = False

        with conn.cursor() as cur:
            cur.execute("DROP SCHEMA public CASCADE;")
            cur.execute("CREATE SCHEMA \"%s\";", [AsIs(username)])
            cur.execute("ALTER SCHEMA \"%s\" OWNER TO \"%s\";", [AsIs(username), AsIs(username)])
        conn.commit()
        connection.autocommit = True

def delete_db(username):
    with connection.cursor() as cursor:
        connection.autocommit = False  # want to make sure we can't be outrun
        # make sure no one can connect to the database
        cursor.execute("UPDATE pg_database SET datallowconn = 'false' WHERE datname = '%s'",
                       [AsIs(username)])
        # drop any existing connections
        cursor.execute("SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '%s'",
                       [AsIs(username)])
        # actually drop the database
        cursor.execute("DROP DATABASE \"%s\";", [AsIs(username)])
        # kick out the user just to be sure
        cursor.execute("SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE usename = '%s'",
                       [AsIs(username)])
        # Drop the user
        cursor.execute("DROP USER \"%s\";", [AsIs(username)])
        connection.commit()
        connection.autocommit = True

def stderr(stderr):
    for line in stderr.splitlines():
        if re.match(r'ERROR:\s(.*)$', line):
            #there's an error
            error = line
            msg = []
            for line in stderr.splitlines():
                if re.match(r'LINE [0-9]+:\s(.*)$', line):
                    msg.append(line)
            error += "\n"
            for line in msg:
                error += line+"\n"
            return error
    return None

def write(database, schema):
    if (schema == ""):
        return

    os.environ["PGPASSWORD"] = database['password']
    process = subprocess.run(
        ["psql", "-h", db_host, "-U", database['username'], "-p", db_port, "-1", database['databasename']],
        input=schema, encoding='ascii', stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    err = stderr(process.stderr)
    if err != None:
        return (False, err)
    return (True, "")


def dump(database):
    os.environ["PGPASSWORD"] = database['password']
    process = subprocess.run(
        ["pg_dump", "-h", db_host, "-U", database['username'], "-p", db_port, "-O", database["databasename"]],
        encoding='ascii', stdout=subprocess.PIPE)

    return process.stdout
