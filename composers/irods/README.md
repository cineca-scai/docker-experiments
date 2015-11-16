
# iRODS server + REST API

This is an attempt to have a multi-container micro-services environment
to simulate some REST API service on top of an iCAT iRODS server.

*WARNING*: this environemnt is in an early stage of development.
You should expect things not to work.

## Pre-requisites

Before starting please make sure that you have installed on your system:

* [Docker](http://docs.docker.com/) 1.9+
* [docker-compose](https://docs.docker.com/compose/) 1.5+

## Quick start

If you need to jump in as soon as possible:

```bash
# Clone repo
git clone cineca/docker-experiments
# Go into this directory
cd composers/irods
# Init services
docker-compose -f docker-compose.yml -f init.yml up
# When completed press CTRL-c and run the final services
docker-compose up
```

## Documentation

For a more detailed explanation and some deep understanding:

* [Preparing the environment](docs/preparation.md)
* [Running the services](docs/running.md)
