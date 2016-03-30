#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
<<<<<<< HEAD
git commit --all -m "adding id to up and down arrows"
=======
git commit --all -m "adding id to up and down arrows"
>>>>>>> master
git push
git push heroku kathryn:master
heroku open