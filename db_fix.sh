#!/bin/bash

export DB_NAME=$(cat src/django_settings/secret.py | grep db_name | sed "s/db_name = //" | sed 's/"//g' | sed "s/'//g")
export DB_USER=$(cat src/django_settings/secret.py | grep db_user | sed "s/db_user = //" | sed 's/"//g' | sed "s/'//g")
export DB_HOST=$(cat src/django_settings/secret.py | grep db_host | sed "s/db_host = //" | sed 's/"//g' | sed "s/'//g")
export DB_PORT=$(cat src/django_settings/secret.py | grep db_port | sed "s/db_port = //" | sed 's/"//g' | sed "s/'//g")
export PGPASSWORD=$(cat src/django_settings/secret.py | grep db_password | sed "s/db_password = //" | sed 's/"//g' | sed "s/'//g")

echo "ALTER TABLE courses DROP CONSTRAINT unique_couple; ALTER TABLE courses ADD UNIQUE (coursename);" | psql -h $DB_HOST -p $DB_PORT -U $DB_USER $DB_NAME
