#!/bin/sh

/usr/sbin/php5-fpm --daemonize --fpm-config /etc/php5/fpm/php-fpm.conf
/usr/sbin/nginx
