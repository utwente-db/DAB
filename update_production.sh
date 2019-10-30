#!/bin/bash
# script of commands that should be run just before running a production server
# deprecated, do not use

git stash
git pull

source ./venv/bin/activate
pip install -r requirements.txt
export HOME=$(pwd)
npm install
npm run production
find . -name "*.map" -type f | xargs rm -f
./manage.py collectstatic --noinput
touch ./uwsgi.ini # to un-cache files

deactivate
