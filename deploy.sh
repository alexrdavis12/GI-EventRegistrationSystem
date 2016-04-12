#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "upating heroku in prep to update master"
git push
git push -f heroku Marc:master
heroku open