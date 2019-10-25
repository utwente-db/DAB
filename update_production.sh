#!/bin/bash
# script of commands that should be run just before running a production server
# deprecated, do not use

git pull

source ./venv/bin/activate
pip install -r requirements.txt
npm install
npm run production
find . -name "*.map" -type f|xargs rm -f
./manage.py collectstatic --noinput

deactivate