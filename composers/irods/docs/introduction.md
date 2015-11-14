
# Quick-start

## Pre-requisites

Install on your system:

* [Docker]() 1.9+
* [docker-compose]() 1.5+

## Initialization
Note: These operations are needed only the first time.

### Data persistence

Since Docker 1.9 you may create volumes with specific names (and drivers) to save data to persist (e.g. libs/data for your Database, or configurations for your server).

Our environment requires two volumes.
You may create them with the commands:
```bash
$ docker volume create --name sqldata
$ docker volume create --name irodsdata
```

Check their existence:
```bash
$ docker volume ls
DRIVER              VOLUME NAME
local               sqldata
local               irodsdata
```

### Database

The postgres image is empty.
To create user and database, use the following:
```bash
docker-compose -f docker-compose.yml -f init.yml up -d sql
```

### iRODS configuration

iRODS server image is ready to be linked to an existing database.

If you created the database and username inside the previous paragraph, you are ready to enable this service with the command:
```bash
# to test
```

*Warning*: In case you really need to debug the connection from the icat container to the postgres db you could try with:
```bash
$ docker-compose up -d
$ docker exec -it irods_icat_1 bash
$ psql -h db -W -d ICAT
# enter password

psql (9.4.5)
ICAT=#
```