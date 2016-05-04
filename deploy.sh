#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "Updating user-side answers"
git push
git push heroku Steevy:master
heroku open
