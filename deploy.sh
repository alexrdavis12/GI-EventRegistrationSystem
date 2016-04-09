#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "merge"
git push
<<<<<<< HEAD
git push heroku Steevy:master
=======
git push heroku Marc:master
>>>>>>> master
heroku open