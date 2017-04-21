#!/bin/bash

if [ -z $LECTURE_PRJ ]; then
    LECTURE_PRJ="lectures"
fi
if [ -z $LECTURE_REPO ]; then
    LECTURE_REPO="github.com/cineca-scai"
fi
if [ -z $LECTURE_BRANCH ]; then
    LECTURE_BRANCH="datanalytics"
fi
if [ -z $LECTURE_PATH ]; then
    # LECTURE_PATH="material/spark_r_scala"
    LECTURE_PATH="material"
fi

echo "LECTURES:"
echo "repo[$LECTURE_REPO] project[$LECTURE_PRJ]"
echo "branch[$LECTURE_BRANCH] path[$LECTURE_PATH] "
echo ""

if [ -d $LECTURE_PRJ ]; then
    echo "Repository already found"
else
    repo="https://${LECTURE_REPO}/${LECTURE_PRJ}.git"
    echo "REPO: $repo"
    git clone $repo
    # git -c http.sslVerify=false clone $repo
fi

cd $LECTURE_PRJ
git checkout $LECTURE_BRANCH
git pull origin $LECTURE_BRANCH
# chown -R $NB_UID . 2> /dev/null
echo "Repo init: completed."
cd $LECTURE_PATH

####################################
# LAUNCH

# export IPYTHON=1
# # exec su $NB_USER -c "jupyter notebook --no-browser --ip 0.0.0.0"

if [ -z "$NB_PORT" ]; then 
    NB_PORT="8888"
fi

start-notebook.sh --port $NB_PORT
