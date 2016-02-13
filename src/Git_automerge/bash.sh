#!/bin/bash
# automerge.sh

# Jenkins uses "-e" parameter, but we want to handle the exit-code manually
set +e

WORKING_DIR=$PWD
cd /var/lib/jenkins/repoAutomerge

# reset local changes
hg update -C .
# get changes from repository
hg pull
# update to branch
hg update -C ${BRANCH}

# try the merge
hg merge develop --config "ui.merge=internal:merge"
mergereturn=$?

case $mergereturn in
	0)
		echo '##################################'
		echo '#####   Merge successfully   #####'
		echo '##################################'

		# commit and push
		hg commit -m 'Automerge' -u 'AutoMerger'
		hg push

		rc=0
		;;
	1)
		echo '####################################################'
		echo '#####   Merge-Conflict, manual merge needed!   #####'
		echo '####################################################'
		rc=1
		;;
	255)
		echo '############################################'
		echo '#####   No Changes (Return-Code 255)   #####'
		echo '############################################'
		rc=0
		;;
	*)
		echo '###############################################'
		echo "#####   Merge-Returncode : $mergereturn   #####"
		echo '###############################################'
		rc=1
		;;
esac

# reset local changes
hg update -C .

exit $rc