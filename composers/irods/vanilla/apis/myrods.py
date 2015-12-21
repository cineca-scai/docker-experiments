#!/usr/bin/env python2
# -*- coding: utf-8 -*-

"""
iRODS reference
"""

import os
import irods
from irods.session import iRODSSession
from restapi import get_logger


# PRINT ALL LOGGERS? CAN YOU DO IT?
# import logging
# irods_original_logger = logging.getLogger('.irods')
# irods_original_logger.setLevel(logging.WARNING)

logger = get_logger(__name__)


#####################################
# IRODS CLASS
class MyRods(object):
    """ A class to use irods with official python apis"""

    _session = None
    _default_zone = None

    def __init__(self):
        super(MyRods, self).__init__()

        # config
        self._default_zone = os.environ['IRODS_ZONE']
        iconnection = {
            'host': os.environ['RODSERVER_ENV_IRODS_HOST'],
            'user': os.environ['IRODS_USER'],
            'password': os.environ['RODSERVER_ENV_IRODS_PASS'],
            'port': os.environ['RODSERVER_PORT_1247_TCP_PORT'],
            'zone': self._default_zone
        }
        self._session = iRODSSession(**iconnection)
        logger.info("Connected to irods")

    def other(self):
        """ To define """
        try:
            coll = self._session.collections.get(
                "/" + self._default_zone)
        except irods.exception.NetworkException as e:
            logger.critical("Failed to read irods object:\n%s" %
                            str(e))
            return False

        # logger.debug(coll.id)
        # logger.debug(coll.path)

        for col in coll.subcollections:
            logger.debug("Collection %s" % col)

        for obj in coll.data_objects:
            logger.debug("Data obj %s" % obj)

        return self

mirods = MyRods()
