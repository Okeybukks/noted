#!/bin/sh
 
sleep 5
cd noted
python3 manage.py makemigrate --settings=core.settings.production
python3 manage.py collectstatic --noinput --settings=core.settings.production
gunicorn core.wsgi:application --bind 0.0.0.0:8000

