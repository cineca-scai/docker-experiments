#!/bin/bash

# Install irods packakges
cd /tmp
echo "Install irods"
yes $IRODS_PASS | sudo -S dpkg -i irods*.deb

echo "Configure & connect"
# Connect server to DB and init
MYDB=`echo $DB_NAME | sed 's/\/[a-z_0-9]\+\///'`
/expect_irods $IRODS_PASS $MYDB
