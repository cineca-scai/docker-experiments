#!/usr/bin/env python2
# -*- coding: utf-8 -*-

"""
An endpoint example
"""

import os
import irods
from irods.session import iRODSSession
from restapi import get_logger
from ..base import ExtendedApiResource
from .. import decorators as decorate
# from confs import config
# from flask.ext.security import roles_required, auth_token_required


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


#####################################
# GRAPH DB

# Parameters
protocol = 'http'
host = 'gdb'
port = '7474'
user = 'neo4j'
pw = 'eudat'
# Connection http descriptor
GRAPHDB_LINK = \
    protocol + "://" + user + ":" + pw + "@" + host + ":" + port + "/db/data"


class MyGraph(object):
    """" A graph db neo4j instance """
    def __init__(self):
        super(MyGraph, self).__init__()
        try:
            os.environ["NEO4J_REST_URL"] = GRAPHDB_LINK
            logger.info("Graph is connected")
        except:
            raise EnvironmentError("Missing REST url configuration for graph")
        # Set debug for cipher queries
        os.environ["NEOMODEL_CYPHER_DEBUG"] = "1"

    def cipher(self, query):
        """ Execute normal neo4j queries """
        from neomodel import db
        try:
            results, meta = db.cypher_query(query)
        except Exception as e:
            raise BaseException(
                "Failed to execute Cipher Query: %s\n%s" % (query, str(e)))
            return False
        logger.debug("Graph query. Res: %s" % results)
        return results

    def other(self):
        return self

migraph = MyGraph()


#####################################
class JustATest(ExtendedApiResource):

    @decorate.apimethod
    def get(self):
        logger.warning("irods call %s", mirods.other())
        logger.warning("graph call %s", migraph.other())
        query = "MATCH (n) OPTIONAL MATCH (n)-[r]-() DELETE n,r"
        migraph.cipher(query)
        return self.response('Hello world!')
