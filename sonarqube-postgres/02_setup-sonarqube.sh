#!/bin/bash

# Configure sonar.properties
echo "******CONFIGURING SONARQUBE JDBC CONNECTION******"
echo "
# Configured by Docker
sonar.jdbc.url=jdbc:postgresql://localhost/sonarqube
sonar.web.context=/sonar
sonar.web.javaAdditionalOpts=-server" >> /opt/sonar/conf/sonar.properties

# Eventually start Sonar
service sonar start
