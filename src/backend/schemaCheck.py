import os
import re
import subprocess

import psycopg2
from django.db import connection

from . import hash
from .studentdb_functions import create_studentdatabase, delete_studentdatabase

db_host = connection.settings_dict["HOST"]
db_port = connection.settings_dict["PORT"]

    
def stderr(stderr):
    """Checks if there is any ERROR output in the standard error. For internal use only.

    :param stderr: the standard error of a psql call
    :type stderr: string
    :returns: The errors in the stderr
    :rtype: string or None
    """
    for line in stderr.splitlines():
        if re.match(r'ERROR:\s(.*)$', line):
            # there's an error
            error = line
            msg = []
            for line in stderr.splitlines():
                if re.match(r'LINE [0-9]+:\s(.*)$', line):
                    msg.append(line)
            error += "\n"
            for line in msg:
                error += line + "\n"
            return error
    return None


    
def check(schema):
    """Checks if the schema contains anything you might not want in a schema.
    
    :param schema: the schema to check
    :type schema:
    :returns: a whether it passed or not, and the reason why 
    :rtype: a tuple of a boolean and a string
    """
    # create new random database with student privileges
    username, password = hash.randomNames()
    create_studentdatabase(username, username, password)
    # attempt to put schema into said database
    os.environ["PGPASSWORD"] = password
    process = subprocess.run(
        ["psql", "-h", db_host, "-U", username, "-p", db_port, "-1", username],
        input=schema, encoding="utf-8", stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    err = stderr(process.stderr)
    if err != None:
        delete_studentdatabase(username, username)
        return (False, err)

    conn = psycopg2.connect(
        user=username,
        password=password,
        host=db_host,
        port=db_port,
        database=username
    )

    with conn.cursor() as cur:
        # http://cully.biz/2013/12/11/postgresql-getting-the-owner-of-tables/
        cur.execute(
            "SELECT t.table_name, t.table_type, u.usename FROM information_schema.tables t JOIN pg_catalog.pg_class c ON (t.table_name = c.relname) JOIN pg_catalog.pg_user u ON (c.relowner = u.usesysid) WHERE not usename='postgres';")
        result = cur.fetchall()
        for row in result:
            if (row[2] != username):
                delete_studentdatabase(username, username)
                return (False, "Owner of " + row[0] + " (a " + row[1] + ") is not the student, but " + row[2])

    delete_studentdatabase(username, username)
    return (True, "");
