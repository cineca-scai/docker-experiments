#!/bin/bash

yes $IRODS_PASS | sudo -S echo "privilege"
sudo chown $UID:$GROUPS -R /var/lib/irods
sudo /etc/init.d/irods start
echo "iRODS online"
sleep infinity
