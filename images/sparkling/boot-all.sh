#!/bin/bash

dir="/data"

# Project
project="lectures"
# Basic branch
branch="massive-analysis"
# Basic path
nbpath="ttmda"
# Basic repo
repo="github.com/cineca-scai"



# If passed through environment
if [ -n "$LECTURE_BRANCH" ]; then
	branch="$LECTURE_BRANCH"
fi

if [ -n "$LECTURE_PATH" ]; then
	nbpath="$LECTURE_PATH"
fi

if [ -n "$LECTURE_REPO" ]; then
        repo="$LECTURE_REPO"
fi

if [ -n "$LECTURE_PRJ" ]; then
        project="$LECTURE_PRJ"
fi

echo "************************"
echo "** LECTURES"
echo "Using: branch[$branch] path[$nbpath] repo[$repo] project[$project]"

cd $dir

if [ -d $project ]; then
    echo "Repository already found"
else
    git -c http.sslVerify=false clone https://${repo}/${project}.git
fi

cd $project
git checkout $branch
git pull origin $branch
chown -R $NB_UID /data 2> /dev/null
echo "Done repository init"

cd $nbpath

###############################
# SET ENVIRONMENT
export IPYTHON=1
export PYSPARK_PYTHON=$CONDA_DIR/bin/python3
export PYSPARK_DRIVER_PYTHON=ipython3
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"

#####################
# BOOT SERVICES

#hadoop/Spark
$BOOTSTRAP
#notebook
start-notebook.sh
