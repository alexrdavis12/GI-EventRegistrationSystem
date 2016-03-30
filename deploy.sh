#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "adding id to up and down arrows"
git push
git push heroku Alex:master
heroku open