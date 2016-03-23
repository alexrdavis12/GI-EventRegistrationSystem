# Coursework project for CSCE 431

Team: D'SMAK

# Heroku Deployment Instructions:

1. git clone @git.github.com:alexrdavis12/GI-EventRegistrationSystem
2. bundle install
3. git push heroku master
4. heroku run rake db:reset

NOTE:
In order to deploy a branch use: <b>git push heroku branchname:master</b>

# GITHUB COMMANDS:
1. <b>git status : </b>this tells you if there are any changes that you have not commited or if there have been updates that you need to pull
2. <b>git push : </b> pushes all of your current commits to the current branch
3. <b>git checkout branchname : </b> switches the branch that you are working on to branch name. Any uncommited changes will be lost
4. <b>git add filename : </b> adds a file to be staged for commit (for some reason this is needed when working on a branch). Using * wildcard makes this easier.
5. <b>git commit --all -m "commit message" : </b> commits all changes to files that are being tracked/staged

# Merging Branches:
To merge branch into master:

1. be sure everything is commited and pushed to the branch
2. git checkout master
3. git status
4. if not upto date pull
5. git merge branch name
6. git push

To sync branch with master:

1. be sure everything is commited and pushed to the branch
2. git checkout master
3. git status
4. if not upto date pull
5. git checkout branch
6. git merge master
7. git push

Have fun!
