
# Deploying your services

### Run the final services

Following the previous section everything should be properly configured.
You can launch postgresql & irods - from now on - with this simple comand:

```bash
$ docker-compose up -d

Recreating irods_sql_1
Recreating irods_icat_1
```

### Verify services and ports

Checking processes with compose must say that both containers are up:
```bash
$ docker-compose ps
    Name                  Command               State    Ports
----------------------------------------------------------------
irods_icat_1   /bootstrap                       Up      1247/tcp
irods_sql_1    /docker-entrypoint.sh postgres   Up      5432/tcp
```

### Opening a shell inside the iRODS iCat server

$ docker exec -it irods_icat_1 bash
irods@rodserver:~$ ils
/tempZone/home/rods:

### Connecting to irods with another container as a client

`To be written...`
