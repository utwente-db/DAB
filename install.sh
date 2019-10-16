#!/bin/sh
# script for setting up production environment

python3 -m venv venv
. venv/bin/activate

pip install -r requirements.txt

npm install
npm run production
find . -name "*.map" -type f|xargs rm -f

echo -n "Have you set up the secret.py file? (FIRST PAGE OF README) (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    ./manage.py collectstatic --noinput
    ./migrate.sh
    deactivate
else
    echo Please run this script again once you have set it up
    deactivate
fi




