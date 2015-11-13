
FROM ubuntu:15.10
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@cineca.it>"

RUN apt-get update
RUN apt-get install -y \
    wget git \
    lsof sudo libfuse2 libjson-perl \
    unixodbc odbc-postgresql postgresql-client super \
    python python-psutil python-requests python-jsonschema

WORKDIR /tmp
ENV IRODSFTP "ftp://ftp.renci.org/pub/irods/releases/4.1.6/ubuntu14"
RUN wget -q $IRODSFTP/irods-icat-4.1.6-ubuntu14-x86_64.deb
RUN wget -q $IRODSFTP/irods-database-plugin-postgres-1.6-ubuntu14-x86_64.deb
RUN dpkg -i *.deb

# To configure this plugin, the following prerequisites need to be met:
#  - an existing database user (to be used by the iRODS server)
#  - an existing database (to be used as the iCAT catalog)
#  - permissions for existing user on existing database

# Then run the following setup script:
#   sudo /var/lib/irods/packaging/setup_irods.sh
