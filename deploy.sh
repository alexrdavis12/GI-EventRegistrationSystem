#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "Demo for client"
git push
git push -f heroku master
heroku open