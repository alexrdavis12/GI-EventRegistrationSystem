#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "modify this comment for your commit"
git push
git push heroku Alex:master
heroku open