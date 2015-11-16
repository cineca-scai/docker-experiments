#!/bin/bash

# Enable sudo withouth password
yes $IRODS_PASS | sudo -S echo "privilege"
# Remove tmp
sudo rm -rf /tmp/*
# Fix permissions
sudo chown $UID:$GROUPS -R /var/lib/irods
# Start irods
sudo /etc/init.d/irods start
echo "iRODS online"
# Go to sleep
sleep infinity
