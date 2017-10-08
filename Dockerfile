FROM phpdockerio/php56-fpm

MAINTAINER vitams

RUN usermod -u 1000 www-data

WORKDIR /var/www/bitrix

CMD ["php-fpm"]

EXPOSE 9000