#!/bin/bash

dir="/data"
project="lectures"
branch="massive-analysis"
nbpath="ttmda"

cd $dir

if [ -d $project ]; then
    echo "Repository already found"
else
    git clone https://github.com/cineca-scai/lectures.git
fi

cd $project
git checkout $branch
git pull origin $branch
chown -R $NB_UID /data
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
