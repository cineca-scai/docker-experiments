#!/bin/bash

# set -e

if [ -z $LECTURE_PRJ ]; then
    # LECTURE_PRJ="lectures"
    LECTURE_PRJ="data"
fi
if [ -z $LECTURE_REPO ]; then
    # LECTURE_REPO="github.com/cineca-scai"
    URL="gitlab.hpc.cineca.it"
    REPO="training"
    LECTURE_REPO="$URL/$REPO"
fi
if [ -z $LECTURE_BRANCH ]; then
    # LECTURE_BRANCH="datanalytics"
    LECTURE_BRANCH="school-rome-2017"
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
    # git -c http.sslVerify=false clone $repo
    git clone $repo
    # mkdir -p $LECTURE_PRJ/$LECTURE_PATH/some
fi

cd $LECTURE_PRJ
git checkout $LECTURE_BRANCH
git pull origin $LECTURE_BRANCH
chown -R $NB_UID $DATA_DIR 2> /dev/null
echo "Repo init: completed."
cd $LECTURE_PATH

####################################
# Trust notebooks
# https://jupyter-notebook.readthedocs.io/en/latest/security.html#explicit-trust

# TO FIX: use xargs and find
exec su $NB_USER -c "env PATH=$PATH jupyter trust */*ipynb"

####################################
# LAUNCH

# export IPYTHON=1

if [ -z "$NB_PORT" ]; then
    NB_PORT="8888"
fi

exec su $NB_USER -c "env PATH=$PATH jupyter notebook --ip 0.0.0.0 --no-browser --port $NB_PORT "
# sleep 1234567890
