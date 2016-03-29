#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
<<<<<<< HEAD
git commit --all -m "testing functionality"
=======
git commit --all -m "testing"
>>>>>>> Alex
git push
git push heroku Steevy:master
heroku open