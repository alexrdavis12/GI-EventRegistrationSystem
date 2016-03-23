# Coursework project for CSCE 606

Team: D'SMAK

# Heroku Deployment Instructions:
1. git clone @git.github.com:alexrdavis12/GI-EventRegistrationSystem
2. bundle install
3. git push heroku master
4. heroku run rake db:reset

NOTE:
In order to deploy a branch use:
  git push heroku branchname:master

# GITHUB COMMANDS:

git status                               // this tells you if there are any changes that you have not commited or if there have been                                              updates that you need to pull
git push                                 // pushes all of your current commits to the current branch
git checkout branchname                  // switches the branch that you are working on to branch name
                                         // note any un commited changes would be lost
git add filename                         // adds a file to be staged for commit (for some reason this is needed when working on a                                                 branch)
                                         //using * wildcard makes this easier
git commit --all -m "commit message"     // commits all changes to files that are being tracked/staged


Have fun!
