#!/usr/bin/env python2
# -*- coding: utf-8 -*-

"""
An endpoint example
"""

from restapi import get_logger
from ..base import ExtendedApiResource
from .. import decorators as decorate

## AUTH
# from confs import config
# from flask.ext.security import roles_required, auth_token_required
## AUTH

from .myrods import mirods
from .mygraph import migraph

# PRINT ALL LOGGERS? CAN YOU DO IT?
# import logging
# irods_original_logger = logging.getLogger('.irods')
# irods_original_logger.setLevel(logging.WARNING)

logger = get_logger(__name__)


#####################################
class JustATest(ExtendedApiResource):

    @decorate.apimethod
    def get(self):
        logger.warning("irods call %s", mirods.other())
        logger.warning("graph call %s", migraph.other())
        query = "MATCH (n) OPTIONAL MATCH (n)-[r]-() DELETE n,r"
        migraph.cipher(query)
        return self.response('Hello world!')
