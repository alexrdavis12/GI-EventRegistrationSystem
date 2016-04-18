#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "committing changes so I can pull from master"
git push
git push heroku kathryn02:master
heroku open