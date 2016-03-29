#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "testing the deploy script"
git push
git push heroku kathryn:master
heroku open