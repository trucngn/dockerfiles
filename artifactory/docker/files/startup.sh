#!/bin/bash
set -e

# run configuration script
. /opt/files/config.sh

# wait for database
. /opt/files/wait-for-postgres.sh ${DB_HOST}

# start artifactory service and wait to leave container alive
service artifactory wait

