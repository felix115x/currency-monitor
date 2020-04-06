FROM php:7.2-apache

RUN apt-get update
RUN docker-php-ext-install sockets mysqli mbstring bcmath pdo_mysql pdo

COPY --chown=www-data:www-data . /app
COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf

RUN usermod -u 1000 www-data

WORKDIR /app
# CMD ["php", "./bin/console", "cache:clear"]
