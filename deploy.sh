#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "got rid of number column on questions/update"
git push
git push heroku kathryn:master
heroku open