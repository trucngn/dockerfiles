#!/bin/bash
set -e

# linking to 'postgres' container: --link db:postgres
if [ -n "$POSTGRES_PORT_5432_TCP_PORT" ]
then
  DB_HOST=$POSTGRES_PORT_5432_TCP_ADDR
  DB_PORT=$POSTGRES_PORT_5432_TCP_PORT
fi
if [ -n "$POSTGRES_ENV_DB_NAME" ]
then
  DB_NAME=$POSTGRES_ENV_DB_NAME
  DB_USER=$POSTGRES_ENV_DB_NAME
  DB_PASSWORD=$POSTGRES_ENV_DB_NAME
fi

DB_HOST=${DB_HOST:-artdb}
DB_PORT=${DB_PORT:-5432}
DB_NAME=${DB_NAME:-artifactory}
DB_USER=${DB_USER:-artifactory}
DB_PASSWORD=${DB_NAME:-password}

# run configuration script if needed
if [ ! -f /opt/${ARTIFACTORY_VERSION}-configured ]
then
  echo "##### Configure PostgreSQL database storage"
  echo ". DB_HOST=${DB_HOST}"
  echo ". DB_PORT=${DB_PORT}"
  echo ". DB_NAME=${DB_NAME}"
  echo ". DB_USER=${DB_USER}"
  
  sed -e 's/{{DB_HOST}}/'"${DB_HOST}"'/' \
      -e 's/{{DB_PORT}}/'"${DB_PORT}"'/' \
      -e 's/{{DB_NAME}}/'"${DB_NAME}"'/' \
      -e 's/{{DB_USER}}/'"${DB_USER}"'/' \
      -e 's/{{DB_PASSWORD}}/'"${DB_PASSWORD}"'/' \
      -i /opt/files/postgresql.properties
  
  cp -v /opt/files/postgresql.properties ${ARTIFACTORY_HOME}/etc/storage.properties
  cp -v /opt/files/${POSTGRES_JDBC_DRIVER} ${ARTIFACTORY_HOME}/tomcat/lib/
  
  echo "##### Install Artifactory as a service"
  $ARTIFACTORY_HOME/bin/installService.sh artifactory artifactory
  
  # Write marker file
  touch /opt/${ARTIFACTORY_VERSION}-configured
fi

