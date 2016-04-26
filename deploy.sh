#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "state dropdown works"
git push
git push heroku master
heroku open
