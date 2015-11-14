#!/bin/bash

user=`whoami`
p1="/home/$user"
p2="/etc/$user"
#p3="/var/lib/$user"

########################################################
yes $IRODS_PASS | sudo -S echo "Enabling priviledges"

# ########################################################
# # Install irods packages (to be saved inside volumes)
# cd /tmp
# echo "(re)Install irods"
# sudo dpkg -i irods*.deb
sudo cp /tmp/etcirods/* $p2/

#########################################################
# Note: using docker volumes, it requires a permission fix, until:
#https://github.com/docker/docker/issues/7198
echo "Fixing permissions"
sudo chown -R $UID:$GROUPS $p1
sudo chown -R $UID:$GROUPS $p2
#sudo chown -R $UID:$GROUPS $p3

#########################################################
# Connect server to DB and init
echo "Configure & connect"
MYDB=`echo $DB_NAME | sed 's/\/[a-z_0-9]\+\///'`
/expect_irods $IRODS_PASS $MYDB

#########################################################
# Check if it works
sleep 6
echo "Testing"
yes $IRODS_PASS | ils 2> /dev/null
echo "Connected"

# /etc/irods
# database_config.json, server_config.json, service_account.config
# /home
# Validating [/home/irods/.irods/irods_environment.json]... Success
