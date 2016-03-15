#!/bin/bash

dir="/data"

# Project
project="lectures"
# Basic branch
branch="massive-analysis"
# Basic path
nbpath="ttmda"

# If passed through environment
if [ -n "$LECTURE_BRANCH" ]; then
    branch="$LECTURE_BRANCH"
    if [ -n "$LECTURE_PATH" ]; then
        nbpath="$LECTURE_PATH"
    fi
fi

echo "************************"
echo "** LECTURES"
echo "Using: branch[$branch] path[$nbpath]"

cd $dir

if [ -d $project ]; then
    echo "Repository already found"
else
    git clone https://github.com/cineca-scai/lectures.git
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
