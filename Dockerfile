FROM php:7.2-fpm

RUN apt-get update

RUN apt-get install -y zlib1g-dev libpq-dev git libicu-dev libxml2-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql \
    && docker-php-ext-install zip xml

RUN curl --insecure https://getcomposer.org/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer

# Set timezone WHY?
#RUN rm /etc/localtime
#RUN ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
#RUN "date"

#COPY . /var/www/symfony_tutorial
WORKDIR /var/www/symfony_tutorial

CMD ["php", "-S", "0.0.0.0:8080"]

docker container run -v d:/Dev/docker-symfony4-tutorial:/var/www/symfony_tutorial --publish 8000:8080 --detach --name bb docker-symfony4-tutorial:1.0