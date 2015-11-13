
# How to test

```bash
$ docker-compose up -d
$ docker exec -it irods_icat_1 bash
irods@rodserver:/tmp$ sudo /var/lib/irods/packaging/setup_irods.sh
```

You may accept all the default options, except for:

* DB host is `db`
* passwords are for default `icatserver`. Inside icat, it is stored as $IRODS_PASS

To verify if everything is succesfull:

```bash
irods@rodserver:/tmp$ ils
```

## Second start

After launching the setup, db and configurations will be saved
as volumes in docker datacontainers.
You may stop/kill/rm your services with compose without losing your data.

Everytime you restart you have to activate irods server again:

```bash
$ docker exec -it irods_icat_1 sudo /etc/init.d/irods start
```

## Admin database

```bash
# Add admin configuration to composer
docker-compose -f docker-compose.yml -f docker-compose.admin.yml up
```

## Remove everything (be careful)

```bash
base='docker-compose -f docker-compose.yml -f docker-compose.admin.yml'
$base stop
# Remove forced, also deleting volumes
$base rm -f -v
```

## Clean your docker environment (be super careful!!)

This command will remove any container and volume you have
on your current docker engine.

```
docker rm -f -v $(docker ps -a -q)
```