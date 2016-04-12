#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "edit questions and user homepage work"
git push
git push -f heroku Marc:master
heroku open