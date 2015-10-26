FROM oraclelinux:6.7
MAINTAINER Truc Nguyen <truc.nguyen@bonitasoft.com>

RUN yum upgrade -y
RUN yum install -y oracle-rdbms-server-11gR2-preinstall unzip sysstat smartmontools
RUN mkdir /opt/oracle /opt/oraInventory /opt/datafile \
 && chown oracle:oinstall -R /opt

ADD linux.x64_11201_database_1of2.zip /tmp/install/linux.x64_11201_database_1of2.zip
ADD linux.x64_11201_database_2of2.zip /tmp/install/linux.x64_11201_database_2of2.zip
RUN cd /tmp/install && unzip linux.x64_11201_database_1of2.zip && unzip linux.x64_11201_database_2of2.zip && rm *.zip

ENV ORACLE_BASE /opt/oracle
ENV ORACLE_HOME $ORACLE_BASE/product/11.2.0/dbhome_1

ADD oraInst.loc /etc/oraInst.loc
RUN chmod 644 /etc/oraInst.loc

ADD db_install.rsp /tmp/install/db_install.rsp
ADD install /tmp/install/install

