#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
<<<<<<< HEAD
git commit --all -m "move up panel"
git push
git push heroku Steevy:master
=======
git commit --all -m "up/down buttons"
git push
git push heroku Marc:master
>>>>>>> master
heroku open