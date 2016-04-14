#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "just a c9 issue?"
git push
git push heroku kathryn02:master
heroku open