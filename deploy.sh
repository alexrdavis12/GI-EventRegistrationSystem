#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "Progress on Edit (prepopulation of options)"
git push
git push heroku Marc:master
heroku open
