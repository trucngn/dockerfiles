FROM ubuntu:14.04
MAINTAINER Truc Nguyen <truc.nguyen@bonitasoft.com>

# Upgrade system
RUN apt-get update && \
    apt-get -y upgrade

# Install subversion
RUN apt-get install -y subversion && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create base directory
RUN mkdir -p /home/svn

# Default repository name
ENV SVN_REPONAME repo

# Copy files
COPY entrypoint.sh /entrypoint.sh
COPY svnserve.conf /svnserve.conf
COPY passwd /passwd

# To store the data outside the container mount /home/svn as a data volume
VOLUME /home/svn

EXPOSE 3690

ENTRYPOINT ["/entrypoint.sh"]
