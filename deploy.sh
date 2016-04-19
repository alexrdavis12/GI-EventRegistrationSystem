#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "added fields show correctly on data table"
git push
git push heroku kathryn02:master
heroku open