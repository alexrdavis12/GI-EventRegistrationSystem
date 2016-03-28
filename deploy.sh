#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "reordering of questions and subquestions complete"
git push
git push heroku Alex:master
heroku open