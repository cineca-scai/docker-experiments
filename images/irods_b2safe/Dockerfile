##########################################################################
FROM ubuntu:15.10
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@cineca.it>"

##########################################################################
# Install dependencies
RUN apt-get update && apt-get install -y wget \
    git coreutils \
    lsof sudo libfuse2 libjson-perl \
    unixodbc odbc-postgresql postgresql-client super \
    python python-psutil python-requests python-jsonschema \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


##########################################################################
# A default system PostgreSQL installation is configured for ident-based auth
# means the unix service account name must match the database user name
ENV IRODS_USER "irods"
ENV IRODS_PASS "icatserver"
RUN useradd -ms /bin/bash $IRODS_USER
RUN yes $IRODS_PASS | passwd $IRODS_USER
ENV HOME /home/$IRODS_USER
RUN adduser $IRODS_USER sudo
USER $IRODS_USER

##########################################################################
# IRODS icat server
# install instructions: https://docs.irods.org/4.1.5/manual/installation
WORKDIR /tmp
ENV IRODSFTP "ftp://ftp.renci.org/pub/irods/releases/4.1.6/ubuntu14"
RUN wget -q $IRODSFTP/irods-icat-4.1.6-ubuntu14-x86_64.deb
RUN wget -q $IRODSFTP/irods-database-plugin-postgres-1.6-ubuntu14-x86_64.deb
# RUN sudo dpkg -i *.deb

##########################################################################
# Install irods + connect to postgres
# Then run the following setup script:
#   sudo /var/lib/irods/packaging/setup_irods.sh

# Resource Server ?
# https://docs.irods.org/4.1.5/manual/installation/#resource-server

##########################################################################
# Clone eudat repo
RUN git clone https://github.com/EUDAT-B2SAFE/B2SAFE-core
