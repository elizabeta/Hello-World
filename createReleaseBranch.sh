#!/bin/bash
#  switch to release branch and pull 
#  create tag "release-YYYYMMDD" and push with "push --tags"
#  switch to master
#  remove release brach local and remote
#  pull master
#  create release branch form master and push


CURRENT_HEAD=`git rev-parse HEAD` 
CURRENT_DATE=`date +"%Y%m%d-%H%M"`


# tag release branch with the current date stamp
git checkout release
git pull
git tag -a 'release-'$CURRENT_DATE $CURRENT_HEAD -m 'tagged release branch'
git push --tags

# back to master
git checkout master
git pull

# delete release branch
git branch -D release
git push origin --delete release

# create release branch from current master
git branch release
git push --set-upstream origin release
git push

echo "Finished creating 'release' branch from master at "$CURRENT_HEAD
