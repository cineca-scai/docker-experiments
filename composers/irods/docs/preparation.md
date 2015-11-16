# Preparing our docker environment

## Initialization
These operations are needed only the first time you run the containers.

### Data persistence

Since Docker 1.9 you may create volumes with specific names (and drivers) to save data to persist (e.g. libs/data for your Database, or configurations for your server).

Our environment requires two volumes.
You may create them before using containers (this is not required) with the commands:
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

The postgresql docker image is (of course) with empty data.
To create user and database, and allow the irods user to access, use the following:
```bash
# Launching db service init in background (-d option)
docker-compose -f docker-compose.yml -f init.yml up -d sql
```

The above operation needs 5/10 seconds to boost.
If you want to verify, compose let you check logs of running containers, so in this case:
```bash
docker-compose logs sql
# press CTRL-c when you see everything is configured
```


### iRODS configuration

iRODS server image is ready to be installed and configured, linking to an existing database.

If you created the database and username inside the previous paragraph, you are ready to enable this service with the command:
```bash
docker-compose -f docker-compose.yml -f init.yml up icat
# we don't leave this operation in background
# it will say "Connected" when everything has gone fine
```

*Warning*: In case you have DB problems and you really need to debug the connection from the icat container to the postgres db you could try with:
```bash
$ docker-compose up -d
$ docker exec -it irods_icat_1 bash
$ psql -h db -W -d ICAT
# enter password

psql (9.4.5)
ICAT=#
# if you arrive here, database linking is fine.
# do some other database checks
```
