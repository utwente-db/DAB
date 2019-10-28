import os
import re
import subprocess
import tempfile

from django.db import connection

from .models import switchPassword

db_host = connection.settings_dict["HOST"]
db_port = connection.settings_dict["PORT"]


def stderr(stderr):
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


def write(database, schema):
    if (schema == ""):
        return

    os.environ["PGPASSWORD"] = database['password']
    process = subprocess.run(
        ["psql", "-h", db_host, "-U", database['username'], "-p", db_port, "-1", database['databasename']],
        input=schema, encoding='utf-8', stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    err = stderr(process.stderr)
    if err != None:
        return (False, err)
    return (True, "")


def dump(database):
    os.environ["PGPASSWORD"] = database['password']
    process = subprocess.run(
        ["pg_dump", "-h", db_host, "-U", database['username'], "-p", db_port, "-O", database["databasename"]],
        encoding='utf-8', stdout=subprocess.PIPE)

    return process.stdout


def dump_course(course):
    databases = course.studentdatabases_set
    if databases.count() == 0:
        return None

    dir = "/tmp/" + course.coursename + ".dump"
    subprocess.run(["mkdir", dir])

    db_host = connection.settings_dict["HOST"]
    db_port = connection.settings_dict["PORT"]

    calls = []

    for database in databases.all():
        database.password = switchPassword(
            database.password)  # can't for the life of me figure out how to override the cursed Courses.studentdatabases_set
        user = database.owner().email
        file = open(dir + "/" + user + ".sql", 'w')
        os.environ["PGPASSWORD"] = database.password
        process = subprocess.Popen(
            ["pg_dump", "-h", db_host, "-p", db_port, "-U", database.username, "-O", database.databasename],
            shell=False, encoding='utf-8', stdout=file)
        calls.append((process, file))

    for call in calls:
        call[0].wait()  # make sure it is done
        call[1].close()

    outfile = tempfile.TemporaryFile(suffix=".zip")  # create a temporary file
    dir = dir[5:]
    print(dir)
    process = subprocess.run(["zip", "-rm", "-", dir], stdout=outfile,
                             cwd="/tmp")  # move the files to our temporary zipfile
    outfile.seek(0)  # reset the filepointer
    return outfile
