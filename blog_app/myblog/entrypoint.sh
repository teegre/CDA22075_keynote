#! /usr/bin/env sh

set -e

./manage.py makemigrations --no-input
./manage.py migrate --no-input
./manage.py collectstatic --no-input

gunicorn myblog.wsgi:application --bind "0.0.0.0:8080"
