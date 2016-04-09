#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "Added Administrator check to all admin functions"
git push
git push heroku Steevy:master
heroku open