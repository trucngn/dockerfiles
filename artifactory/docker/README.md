# Artifactory with PostgreSQL

Run [Artifactory repository manager Open Source](https://www.jfrog.com/open-source/) inside a Docker container using PostgreSQL storage.

**Docker image:** [tnguyen1/artifactory-with-postgres](https://registry.hub.docker.com/u/tnguyen1/artifactory-with-postgres/)

## Volumes
Artifactory's `data`, `logs` and `backup` directories are exported as volumes:

    /opt/artifactory/current/data
    /opt/artifactory/current/logs
    /opt/artifactory/current/backup

## Ports
The web server is accessible through port `8081`.

## Environment variables

These environment variables can be injected to configure PostgreSQL connection for Artifactory.

- **DB_HOST** - default _artdb_
- **DB_PORT** - default _5432_
- **DB_NAME** - default _artifactory_
- **DB_USER** - default _artifactory_
- **DB_PASSWORD** - default _password_

## Running with Docker Compose

The recommended way to run this container is through [Docker Compose](https://docs.docker.com/compose/) linked to [PostgreSQL](https://registry.hub.docker.com/_/postgres/) container.

**@see** Sample [Docker Compose definition](https://github.com/tnguyen1/dockerfiles/tree/master/artifactory)

