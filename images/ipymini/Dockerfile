
FROM iron/base
#FROM ubuntu:15.10
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@cineca.it>"

RUN apk update && apk upgrade && apk add \
# List of OS packages \
    python3 \
    git wget \
    # ncurses bash \
    # ALSO LINK PYTHON3 as PYTHON \
    #py-lxml \
    && rm -rf /var/cache/apk/* && \
    wget https://bootstrap.pypa.io/ez_setup.py -O - | python3 && \
    easy_install-3.5 pip


RUN pip --no-cache-dir install --no-cache-dir \
# List of python libraries \
# // TO FIX: what to do with Eudat Python2 libraries?
    #httplib2 requests defusedxml lxml queuelib dweepy \
    git+git://github.com/esafak/commentjson.git \
    #simplejson commentjson \
    py2neo neomodel \
    flask-sqlalchemy flask-security flask-restful \
    flask-admin flask-restplus flask-cors \
    plumbum
# PYTHON CLIENT?
#git+git://github.com/irods/python-irodsclient.git
# OR ICOMMANDS?
#ftp://ftp.renci.org/pub/irods/releases/4.1.7/irods-4.1.7.tar.gz
