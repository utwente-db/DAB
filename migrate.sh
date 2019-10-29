#!/bin/bash

export DB_NAME=$(cat src/django_settings/secret.py | grep db_name | sed "s/db_name = //" | sed 's/"//g' | sed "s/'//g")
export DB_USER=$(cat src/django_settings/secret.py | grep db_user | sed "s/db_user = //" | sed 's/"//g' | sed "s/'//g")
export DB_HOST=$(cat src/django_settings/secret.py | grep db_host | sed "s/db_host = //" | sed 's/"//g' | sed "s/'//g")
export DB_PORT=$(cat src/django_settings/secret.py | grep db_port | sed "s/db_port = //" | sed 's/"//g' | sed "s/'//g")
export PGPASSWORD=$(cat src/django_settings/secret.py | grep db_password | sed "s/db_password = //" | sed 's/"//g' | sed "s/'//g")

cat schema.sql | psql -h $DB_HOST -p $DB_PORT -U $DB_USER $DB_NAME
echo "INSERT INTO dbmusers(role, email, password, verified) VALUES(0, 'info@utwente.nl', 'sha3_256\$HcbFtxZw\$7y5cYH+mkK1t7gms/BPo8nWqXewQ9pSO/8VTPTDbchg=', true);" | psql -h $DB_HOST -p $DB_PORT -U $DB_USER $DB_NAME
