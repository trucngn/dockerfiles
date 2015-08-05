#!/bin/bash

# Setup SVN
if [[ ! -d "/home/svn/$SVN_REPONAME" ]]; then
    echo ". Initializing repository $SVN_REPONAME"
    svnadmin create /home/svn/$SVN_REPONAME
    cp /svnserve.conf /home/svn/$SVN_REPONAME/conf/svnserve.conf
    cp /passwd /home/svn/$SVN_REPONAME/conf/passwd
else
    echo ". Serving existing repository $SVN_REPONAME"
fi

# Start SVN
/usr/bin/svnserve -d --foreground -r /home/svn
