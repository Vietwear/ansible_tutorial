#!/usr/bin/env bash
#!/bin/bash
# Custom functions implementation
function processgitstaging {
    git checkout -b staging origin/staging
    git merge master
    git push origin staging
}
function processgitproduction {
    git checkout -b production origin/production
    git merge staging
    git push origin production
}
#################

# Output main info
echo "### GIT BRANCH MERGE SCRIPT ###"

# Read user input
read -e -p "Merge staging with master(y/n): " -i y MERGESTAGING
read -e -p "Merge production with staging(y/n): " -i y MERGEPRODUCTION

cd tmp/
git clone git@github.com:Bounce182/test.git

# Process staging branch merging
if [ $MERGESTAGING = "y" ]; then
    echo "##Merging staging with master##"
    cd test/
    processgitstaging
    cd ..
else
    echo "Skipping staging merge"
fi

# Process production branch merging
if [ $MERGEPRODUCTION = "y" ]; then
    cd test/
    echo "##Merging production with staging##"
    processgitproduction
    cd ..
else
    echo "Skipping production merge"
fi

# Clearing the tmp folder
echo "## Clearing the tmp folder ##"

echo "Current dir: " `pwd`

CURRENT_DIR=`pwd`

if [[ $CURRENT_DIR =~ "tmp" ]]
then
        echo "Clearing the tmp dir"
        rm -rf *
else
        echo "Cannot clear the tmp dir. Clear it manually."
fi

echo "### Merge script end ###"
- See more at: http://anvweb.com/blog/linux-bash-script-for-git-branches-merging/#sthash.QGo1xbUg.dpuf