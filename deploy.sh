#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "changed order of lastname and firstname"
git push
git push heroku kathryn02:master
heroku open