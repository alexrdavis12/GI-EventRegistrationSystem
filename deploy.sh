#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "edit description of event works"
git push
git push heroku kathryn:master
heroku open