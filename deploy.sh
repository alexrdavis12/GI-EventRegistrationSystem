#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "damn dev log"
git push
git push -f heroku Alex:master
heroku open