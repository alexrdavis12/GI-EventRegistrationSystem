#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "make UI akin to Alex's version"
git push
git push heroku Marc:master
heroku open