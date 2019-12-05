FROM php:7.4-apache

RUN apt-get update

RUN apt-get install -y wget zlib1g-dev libpq-dev git libicu-dev libxml2-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql \
    && docker-php-ext-install xml \
    && docker-php-ext-install opcache

RUN curl --insecure https://getcomposer.org/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer

### Install symfony installer ###
RUN wget https://get.symfony.com/cli/installer -O - | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony

# Set timezone WHY?
#RUN rm /etc/localtime
#RUN ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
#RUN "date"

WORKDIR /var/www/html

COPY . /var/www/html

### TO RUN COMPOSER INSTALL WE NEED TO COPY FILES INTO CONTAINER FIRST ###
RUN composer install
RUN composer require logger
#RUN symfony server:start --port=8080

### CREATE NEW SYMFONY PROJECT ###
#RUN git config --global user.email "web.pavlo@gmail.com"
#RUN git config --global user.name "pavloivanov"
#RUN symfony new .
#RUN rm -rf .gitignore

#CMD ["php", "-S", "0.0.0.0:8080"]