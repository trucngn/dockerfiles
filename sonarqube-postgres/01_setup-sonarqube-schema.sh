#!/bin/bash

echo "******CREATING SONARQUBE SCHEMA******"
gosu postgres postgres --single <<- EOSQL
   CREATE DATABASE sonarqube;
   CREATE USER sonar WITH PASSWORD 'sonar';
   GRANT ALL PRIVILEGES ON DATABASE sonarqube to sonar;
EOSQL
echo ""
echo "******SONARQUBE SCHEMA CREATED******"
