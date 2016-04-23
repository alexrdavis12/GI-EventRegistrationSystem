#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "Profile Relocatio + tests"
git push
git push heroku master
heroku open
