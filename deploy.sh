#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "up/down buttons"
git push
git push heroku Marc:master
heroku open