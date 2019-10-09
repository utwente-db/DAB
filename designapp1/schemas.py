import os
import re
import subprocess

from . import hash
from django.db import connection

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
