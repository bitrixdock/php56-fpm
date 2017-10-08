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

RUN sed -i "/short_open_tag = .*/c\short_open_tag = On" /etc/php5/fpm/php.ini
RUN sed -i "/max_input_vars = .*/c\max_input_vars = 10000" /etc/php5/fpm/php.ini
RUN sed -i "/mbstring.func_overload = .*/c\mbstring.func_overload = 2" /etc/php5/fpm/php.ini
RUN sed -i "/mbstring.internal_encoding = .*/c\mbstring.internal_encoding = 'utf-8'" /etc/php5/fpm/php.ini

RUN usermod -u 1000 www-data

EXPOSE 9000