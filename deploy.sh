#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
<<<<<<< HEAD
git commit --all -m "checking the sync"
git push
git push heroku Alex:master
=======
git commit --all -m "move up panel"
git push
git push heroku Steevy:master
>>>>>>> master
heroku open