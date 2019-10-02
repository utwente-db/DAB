import os
import re
import subprocess

from django.db import connection

db_host = connection.settings_dict["HOST"]
db_port = connection.settings_dict["PORT"]

"""Checks if the schema contains anything you might not want in a schema.
Returns a tuple of whether it passed or not, and the reason why as a string"""


def check(schema):
    schema = schema.lower()  # remove case sensitivity
    # Schema should not set ownership
    if "owner to" in schema:
        return (False, "Schema should not set ownership")

    for line in schema:
        match = re.match(r'^create table ([a-z0-9]+)\.([a-z0-9]+)\s*\(\s*$', line)
        if match:
            if not "create schema " + match.groups()[0] in schema:
                return (False, "Schema " + match.groups()[0] + " used in table " + match.groups()[
                    1] + ", but schema was never created")

    return (True, "")


def write(database, schema):
    if (schema == ""):
        return

    os.environ["PGPASSWORD"] = database['password']
    process = subprocess.run(
        ["psql", "-h", db_host, "-U", database['username'], "-p", db_port, database['databasename']],
        input=schema + ";\\n\\q\\n", encoding='ascii', stdout=subprocess.PIPE)


def dump(database):
    os.environ["PGPASSWORD"] = database['password']
    process = subprocess.run(
        ["pg_dump", "-h", db_host, "-U", database['username'], "-p", db_port, "-O", database["databasename"]],
        encoding='ascii', stdout=subprocess.PIPE)

    return process.stdout
