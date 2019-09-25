#!/bin/bash

source venv/bin/activate
npm run production
./manage.py collectstatic

# floris' other commands go here