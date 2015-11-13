
# iRODS server + REST API

This is an attempt to have a multi-container micro-services environment
to simulate some REST API service on top of an iCAT iRODS server.

*WARNING*: this environemnt is in an early stage of development.
You should expect things not to work.

## How to test

```bash
$ docker-compose up -d
$ docker exec -it irods_icat_1 bash
irods@rodserver:/tmp$ sudo /var/lib/irods/packaging/setup_irods.sh
```

You may accept all the default options, except for:

* DB host is `db`
* passwords are always `icatserver`

To verify if everything is succesfull:

```bash
irods@rodserver:/tmp$ ils
```
