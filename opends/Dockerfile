FROM java:7
MAINTAINER Truc Nguyen <truc.nguyen@bonitasoft.com>

ENV OPENDS_VERSION 2.3.0-build003

# Define base working directory
WORKDIR /data

# Download OpenDS build
RUN wget http://java.net/downloads/opends/promoted-builds/${OPENDS_VERSION}/OpenDS-${OPENDS_VERSION}.zip && \
    unzip -q OpenDS-${OPENDS_VERSION}.zip && \
    rm OpenDS-${OPENDS_VERSION}.zip

# Define OpenDS working directory
WORKDIR /data/OpenDS-${OPENDS_VERSION}

# Expose LDAP port
EXPOSE 389

VOLUME /ldif

# Entrypoint
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
