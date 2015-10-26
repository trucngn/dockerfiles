FROM oracle-11g:created
MAINTAINER Truc Nguyen <truc.nguyen@bonitasoft.com>

ENV ORACLE_SID=orcl

RUN rm -rf /tmp/install

# Exposes the default TNS port, as well as the Enterprise Manager HTTPS (1158) port.
EXPOSE 1521 1158

ADD startdb.sql $ORACLE_HOME/config/scripts/startdb.sql
ADD start /tmp/start
CMD /tmp/start

