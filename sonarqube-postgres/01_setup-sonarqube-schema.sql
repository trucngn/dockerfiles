CREATE DATABASE sonarqube;
CREATE USER sonar WITH PASSWORD 'sonar';
GRANT ALL PRIVILEGES ON DATABASE sonarqube to sonar;
