#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "move up panel"
git push
git push heroku Steevy:master
heroku open