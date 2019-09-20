from django.db import connection
import os
import subprocess
from .models import Studentdatabases

db_host = connection.settings_dict["HOST"]
db_port = connection.settings_dict["PORT"]

def write(database, schema):
	if(schema == ""):
		return

	os.environ["PGPASSWORD"] = database.password
	process = subprocess.run(["psql", "-h", db_host, "-U", database.username, "-p", db_port, database.databasename], input=schema, encoding='ascii', stdout=subprocess.PIPE)
