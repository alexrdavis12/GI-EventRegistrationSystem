#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "can correctly add, delete, and move questions on edit"
git push
git push heroku kathryn:master
heroku open