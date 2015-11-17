#!/bin/bash

#####################################
# Resources
echo "Fix resources"
iadmin rmresc demoResc
# Create resources
iadmin mkresc $MAINRES unixfilesystem $IRODS_HOST:$MAINRES_DIR
iadmin mkresc $REPLICARES unixfilesystem $IRODS_HOST:$REPLICA_DIR
# Set new default
sed -i "4s/demoResc/$MAINRES/" ~/.irods/irods_environment.json
sed -i "15s/demoResc/$MAINRES/" /etc/irods/server_config.json

## source:http://irods.org/post/configuring-irods-for-high-availability/#.VktEE98veGg
# iadmin mkresc BaseResource replication
# iadmin mkresc Resource1 'unixfilesystem' Resource1.example.org:/var/lib/irods/Vault
# iadmin mkresc Resource2 'unixfilesystem' Resource2.example.org:/var/lib/irods/Vault
# iadmin addchildtoresc BaseResource Resource1
# iadmin addchildtoresc BaseResource Resource2
# ilsresc --tree

#####################################
# B2SAFE SERVICE
cd /opt/eudat/b2safe/packaging  
# Configure
source $HANDLECONF
keytochange='CHANGEME'
sed -i "14s/$keytochange/$MAINRES"
sed -i "19s/$keytochange/$HOSTNAME"
sed -i "22s/$keytochange/$HANDLE_BASE"
sed -i "23s/$keytochange/$HANDLE_USER"
sed -i "24s/$keytochange/$HANDLE_PREFIX"
mv myconf install.conf

# Install b2safe
PASSFILE='mypass'
echo $HANDLE_PASS > $PASSFILE
./install.sh < $PASSFILE
rm $PASSFILE
