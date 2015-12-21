#!/usr/bin/env python2
# -*- coding: utf-8 -*-

"""
Graph
"""

import os
from restapi import get_logger

logger = get_logger(__name__)

#####################################
# GRAPH DB

# Parameters
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

