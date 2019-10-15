#!/bin/sh
# script of commands that should be run just before running a production server
# deprecated, do not use

. ../venv/bin/activate
npm install
npm run production
find . -name "*.map" -type f|xargs rm -f
./manage.py collectstatic --noinput

# floris' other commands go here

deactivate