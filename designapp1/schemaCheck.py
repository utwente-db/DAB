from psycopg2.extensions import AsIs
import psycopg2
from .studentdb_functions import create_studentdatabase, delete_studentdatabase, connect
from . import hash
import os
import subprocess
from django.db import connection
import re

db_host = connection.settings_dict["HOST"]
db_port = connection.settings_dict["PORT"]

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


"""Checks if the schema contains anything you might not want in a schema.
Returns a tuple of whether it passed or not, and the reason why as a string"""
def check(schema):
    #create new random database with student privileges
    username, password = hash.randomNames()
    create_studentdatabase(username, username, password)
    #attempt to put schema into said database
    os.environ["PGPASSWORD"] = password
    process = subprocess.run(
        ["psql", "-h", db_host, "-U", username, "-p", db_port, "-1", username],
        input=schema, encoding="utf-8", stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    err = stderr(process.stderr)
    if err != None:
        delete_studentdatabase(username, username)
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
                delete_studentdatabase(username, username)
                return (False, "Owner of "+row[0]+" (a "+row[1]+") is not the student, but "+row[2])

    delete_studentdatabase(username, username)
    return (True, "");
