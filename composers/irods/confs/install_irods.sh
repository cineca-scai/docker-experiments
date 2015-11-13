#!/bin/bash

# Install irods packakges
cd /tmp
sudo dpkg -i *.deb

# Connect server to DB and init
expect eirods
