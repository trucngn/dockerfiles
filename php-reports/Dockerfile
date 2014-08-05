# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.12
MAINTAINER Truc Nguyen <truc.nguyen@bonitasoft.com>

# Set correct environment variables.
ENV HOME /root

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install php-reports and its required packages
RUN apt-get update \
    && apt-get install -y nginx php5-cli php5-fpm php5-mysql git

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

RUN git clone git://github.com/jdorn/php-reports.git /app \
    && cd /app \
    && composer install

# Configure php-fpm and nginx
RUN sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/fpm/php.ini
ADD nginx_default /etc/nginx/sites-available/default

# Startup script which starts php-fpm and nginx
ADD 01_startup.sh /etc/my_init.d/01_startup.sh

# Configure SSH server
RUN mkdir -p /var/run/sshd
RUN echo 'root:root' |chpasswd

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose SSH and HTTP ports
EXPOSE 22 80
