#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "edit vehicle"
git push
git push -f heroku master
heroku open