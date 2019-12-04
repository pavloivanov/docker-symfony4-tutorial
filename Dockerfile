FROM php:7.2-fpm

RUN apt-get update

RUN apt-get install -y wget zlib1g-dev libpq-dev git libicu-dev libxml2-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql \
    && docker-php-ext-install zip xml \
    && docker-php-ext-install opcache

RUN curl --insecure https://getcomposer.org/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer

# Set timezone WHY?
#RUN rm /etc/localtime
#RUN ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
#RUN "date"

WORKDIR /var/www/symfony_tutorial

### CREATE NEW SYMFONY PROJECT ###
#RUN wget https://get.symfony.com/cli/installer -O - | bash
#RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony
#RUN git config --global user.email "web.pavlo@gmail.com"
#RUN git config --global user.name "pavloivanov"
#RUN symfony new .
#RUN rm -rf .gitignore

CMD ["php", "-S", "0.0.0.0:8080"]