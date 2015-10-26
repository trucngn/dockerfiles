# Oracle 11g Release 2
A [Docker](https://www.docker.com/) image with [Oracle Database 11g Enterprise Edition Release 11.2.0.1.0](http://www.oracle.com/technetwork/database/enterprise-edition/overview/index.html) running in [Oracle Linux 6.7](http://www.oracle.com/us/technologies/linux/overview/index.html)
- ORCL database on port 1521
- Enterprise Manager on HTTPS port 1158

## Build

#### Step 1
1) Download `linux.x64_11201_database_1of2.zip` & `linux.x64_11201_database_2of2.zip` from [Oracle Tech Net](http://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html)

2) Put the 2 zip files in the `step1` directory

3) `cd` to the `oracle-11g` repo directory

4) `$ docker build -t oracle-11g:step1 step1`

5) `$ docker run --privileged -ti --name step1 oracle-11g:step1 bash`

6) ` # /tmp/install/install` (takes about 5m)
```
[root@f05834f3a0fe /]# /tmp/install/install
Mon Oct 26 10:36:36 UTC 2015
Installing database...
Starting Oracle Universal Installer...

Checking Temp space: must be greater than 120 MB.   Actual 38624 MB    Passed
Checking swap space: must be greater than 150 MB.   Actual 15975 MB    Passed
Preparing to launch Oracle Universal Installer from /tmp/OraInstall2015-10-26_10-36-36AM. Please wait ...You can find the log of this install session at:
 /opt/oraInventory/logs/installActions2015-10-26_10-36-36AM.log
The following configuration scripts need to be executed as the "root" user.
 #!/bin/sh
 #Root scripts to run

/opt/oracle/product/11.2.0/dbhome_1/root.sh
To execute the configuration scripts:
         1. Open a terminal window
         2. Log in as "root"
         3. Run the scripts
         4. Return to this window and hit "Enter" key to continue

Successfully Setup Software.

Mon Oct 26 10:39:00 UTC 2015
Finishing configuration...
Check /opt/oracle/product/11.2.0/dbhome_1/install/root_f05834f3a0fe_2015-10-26_10-39-00.log for the output of root script

Mon Oct 26 10:39:00 UTC 2015
Done! Commit the container now.
[root@f05834f3a0fe /]#
```

7) ` # exit`

8) `$ docker commit step1 oracle-11g:installed`

#### Step 2
1) `$ docker build -t oracle-11g:step2 step2`

2) `$ docker run --privileged -ti --name step2 oracle-11g:step2 bash`

3) ` # /tmp/intall/create` (takes about 15m)
```
[root@3cccfeafca0c /]# /tmp/install/create
Mon Oct 26 10:44:29 UTC 2015
Creating listener...   

Parsing command line arguments:
    Parameter "silent" = true
    Parameter "responsefile" = /tmp/install/database/response/netca.rsp
Done parsing command line arguments.
Oracle Net Services Configuration:
Profile configuration complete.
Oracle Net Listener Startup:
    Running Listener Control:
      /opt/oracle/product/11.2.0/dbhome_1/bin/lsnrctl start LISTENER
    Listener Control complete.
    Listener started successfully.
Listener configuration complete.
Oracle Net Services configuration successful. The exit code is 0
Mon Oct 26 10:44:30 UTC 2015
Creating database...
/bin/cat: /proc/sys/net/core/wmem_default: No such file or directory
/bin/cat: /proc/sys/net/core/wmem_default: No such file or directory
/bin/cat: /proc/sys/net/core/wmem_default: No such file or directory
Copying database files
1% complete
3% complete
11% complete
18% complete
26% complete
37% complete
Creating and starting Oracle instance
40% complete
45% complete
50% complete
55% complete
56% complete
60% complete
62% complete
Completing Database Creation
66% complete
70% complete
73% complete
85% complete
96% complete
100% complete
Look at the log file "/opt/oracle/cfgtoollogs/dbca/orcl/orcl.log" for further details.

Mon Oct 26 10:51:43 UTC 2015
Creating password file...

Mon Oct 26 10:51:43 UTC 2015
Running catalog.sql...

Mon Oct 26 10:53:17 UTC 2015
Running catproc.sql...

Mon Oct 26 10:58:16 UTC 2015
Running pupbld.sql...

Finalizing install and shutting down the database...

SQL*Plus: Release 11.2.0.1.0 Production on Mon Oct 26 10:58:16 2015

Copyright (c) 1982, 2009, Oracle.  All rights reserved.


Connected to:
Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options

Database closed.
Database dismounted.   
ORACLE instance shut down.
Disconnected from Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options

Mon Oct 26 10:58:30 UTC 2015
Done! Commit the container now.
```
4) ` # exit`

5) `$ docker commit step2 oracle-11g:created`

#### Step 3
1) `$ docker build -t oracle-11g step3`

## Run
Create and run a container named oracle-11g with **mandatory hostname *oradb11g***:
```
$ docker run --privileged -dP -h oradb11g --name oracle-11g oracle-11g
```

## Connect
- `$ sqlplus sys/change_on_install as sysdba`
- `$ sqlplus system/manager`

## License
[GNU Lesser General Public License (LGPL)](http://www.gnu.org/licenses/lgpl-3.0.txt) for the contents of this GitHub repo; for Oracle's database software, see their [Licensing Information](http://docs.oracle.com/cd/E11882_01/license.112/e47877/toc.htm)
