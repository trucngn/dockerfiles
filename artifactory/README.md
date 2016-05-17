This Docker recipe runs [Artifactory repository manager Open Source](https://www.jfrog.com/open-source/) with OpenJDK 8 on PostgreSQL 9.5.

Content of this recipe:
- **docker** - Dockerfile to build the Artifactory's image

`docker> docker build -t tnguyen1/artifactory-oss:4.7.6 .`
- **compose** - [Docker Compose](https://docs.docker.com/compose/) definition to run Artifactory on [PostgreSQL official image](https://registry.hub.docker.com/_/postgres/).

`compose> docker-compose up|stop|start`
