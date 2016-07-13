FROM ubuntu:16.04

# install php
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
        php \
        php7.0-fpm \
        php7.0-cgi \
        php7.0-intl \
        php7.0-mysql \
        php7.0-gd \
        php7.0-curl \
        php7.0-xml \
        php7.0-zip

# install composer
RUN php -r "readfile('https://getcomposer.org/installer');" | php && \
    chmod +x composer.phar && \
    mv composer.phar /usr/local/bin/composer && \
    export PATH="~/.composer/vendor/bin/:$PATH"

# install nginx
RUN apt-get install -y nginx

# install text packages like envsubst
RUN apt-get install -y gettext-base

# make default user www-data
RUN usermod -u 1000 www-data

# add files
ADD docker/docker-entrypoint.sh /docker-entrypoint.sh
ADD docker/nginx/default.conf /etc/nginx/sites-available/default
ADD docker/php/www.conf /etc/php/7.0/fpm/pool.d/www.conf.tpl

# add code to container
ADD project/ /var/www/project/

# create volume
VOLUME /var/www/project
WORKDIR /var/www/project

# expose ports
EXPOSE 80

# entry point
ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]
