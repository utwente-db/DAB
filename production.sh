#!/bin/bash

source ../venv/bin/activate
npm run production
find . -name "*.map" -type f|xargs rm -f
./manage.py collectstatic --noinput

# floris' other commands go here

deactivate