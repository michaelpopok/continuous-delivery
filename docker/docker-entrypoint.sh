#!/usr/bin/env bash

# install composer
composer install

#configure php fpm
envsubst < /etc/php/7.0/fpm/pool.d/www.conf.tpl > /etc/php/7.0/fpm/pool.d/www.conf

# set permissions
rm -rf /var/www/project/var/cache/*
chown www-data:www-data -R /var/www/project/var

#start services
service nginx start;
service php7.0-fpm start;

service nginx status;
service php7.0-fpm status;

/bin/bash
