#!/bin/bash
git add app* bin* config* db* features* lib* log* public* script* spec* tes* vendor*
git commit --all -m "testing dev environment"
git push
git push heroku Deyana: master

