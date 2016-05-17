#!/bin/bash
set -e

marker_file=/docker-entrypoint-initdb.d/init-user-db.done
if [ ! -f $marker_file ]
then
  DB_NAME=${DB_NAME:-artifactory}
  DB_USER=${DB_USER:-artifactory}
  DB_PASSWORD=${DB_NAME:-password}
  
  cp /docker-entrypoint-initdb.d/createdb_tpl /docker-entrypoint-initdb.d/createdb_sql
  sed -e 's/{{DB_USER}}/'"${DB_USER}"'/' \
      -e 's/{{DB_PASSWORD}}/'"${DB_PASSWORD}"'/' \
      -e 's/{{DB_NAME}}/'"${DB_NAME}"'/' \
      -i /docker-entrypoint-initdb.d/createdb_sql
  
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f /docker-entrypoint-initdb.d/createdb_sql
  
  # Write marker file
  touch $marker_file
fi

