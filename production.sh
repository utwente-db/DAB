#!/bin/sh

. ../venv/bin/activate
npm install
npm run production
find . -name "*.map" -type f|xargs rm -f
./manage.py collectstatic --noinput

# floris' other commands go here

deactivate