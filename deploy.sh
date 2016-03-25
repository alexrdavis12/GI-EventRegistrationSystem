#!/bin/bash
git add *
git commit --all -m "modify this comment"
git push
git push heroku Alex:master
heroku open