#!/bin/bash

user=`whoami`
p1="/home/$user"
p2="/etc/$user"

cd /tmp

########################################################
yes $IRODS_PASS | sudo -S echo "Enabling priviledges"
# Wait for sql init/creation
sleep 5

# ########################################################
# Using the volume
## Note: this should be removed when fixed the hack inside the dockerfile.
echo "Fix missing files for volumes"
sudo cp copy/etcirods/* $p2/

#########################################################
# Note: using docker volumes, it requires a permission fix, until:
#https://github.com/docker/docker/issues/7198
echo "Fixing permissions"
sudo chown -R $UID:$GROUPS $p1
sudo chown -R $UID:$GROUPS $p2

#########################################################
# Connect server to DB and init
echo "Configure & connect"
MYDATA="/tmp/answers"
./expect_irods $MYDATA
sudo /var/lib/irods/packaging/setup_irods.sh < $MYDATA

#########################################################
# Check if it works
sleep 5
echo "Testing"
yes $IRODS_PASS | ils 2> /dev/null
echo "Connected"
