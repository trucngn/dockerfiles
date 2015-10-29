FROM postgres:9.3
MAINTAINER Truc Nguyen <truc.nguyen@bonitasoft.com>

ENV DEBIAN_FRONTEND noninteractive

# Pre-requisites
RUN \
  apt-get update && \
  apt-get -y upgrade

RUN apt-get install -y apt-utils

RUN apt-get install -y software-properties-common python-software-properties

# Install Java
RUN \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  sed -i 's/jessie/trusty/g' /etc/apt/sources.list.d/webupd8team-java-jessie.list && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk7-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

# Install Sonarqube
RUN \
  echo "deb http://downloads.sourceforge.net/project/sonar-pkg/deb binary/" >> /etc/apt/sources.list.d/sonar.list && \
  apt-get update && \
  apt-get install -y --force-yes sonar

# DB schema creation
ADD 01_setup-sonarqube-schema.sql /docker-entrypoint-initdb.d/

# Sonar setup
ADD 02_setup-sonarqube.sh /docker-entrypoint-initdb.d/

# Expose Sonar web server port
EXPOSE 9000
