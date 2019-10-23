export DB_NAME=$(cat designproject/secret.py | grep db_name | sed "s/db_name = //" | sed 's/"//g' | sed "s/'//g")
export DB_USER=$(cat designproject/secret.py | grep db_user | sed "s/db_user = //" | sed 's/"//g' | sed "s/'//g")
export DB_HOST=$(cat designproject/secret.py | grep db_host | sed "s/db_host = //" | sed 's/"//g' | sed "s/'//g")
export DB_PORT=$(cat designproject/secret.py | grep db_port | sed "s/db_port = //" | sed 's/"//g' | sed "s/'//g")
export PGPASSWORD=$(cat designproject/secret.py | grep db_password | sed "s/db_password = //" | sed 's/"//g' | sed "s/'//g")

echo -n "Please enter the email you wish to promote"
read answer

echo "UPDATE dbmusers SET role=0 WHERE email='$answer';" | psql -h $DB_HOST -U $DB_USER -p $DB_PORT $DB_NAME
