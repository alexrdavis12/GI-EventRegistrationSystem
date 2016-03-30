#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
<<<<<<< HEAD
git commit --all -m "adding id to up and down arrows"
=======
git commit --all -m "testing functionality"
>>>>>>> 163d5acbcc2b0918c79168b032879b0e3aa80df6
git push
git push heroku kathryn:master
heroku open