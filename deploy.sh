#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "testing move sub questions"
git push
git push heroku Alex:master
heroku open