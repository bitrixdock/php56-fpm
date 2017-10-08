FROM phpdockerio/php56-fpm

MAINTAINER vitams

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php5-memcached \
    php5-memcache \
    php5-mysql \
    php5-intl \
    php5-xdebug \
    php5-interbase \
    php5-gd \
    php5-imagick \
    php5-mcrypt \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN usermod -u 1000 www-data

EXPOSE 9000