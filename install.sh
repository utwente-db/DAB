#!/bin/sh

python3 -m venv venv
. venv/bin/activate

pip install -r requirements.txt

npm install
npm run production
find . -name "*.map" -type f|xargs rm -f

./manage.py collectstatic --noinput

deactivate
