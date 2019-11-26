FROM php:7.2-cli

COPY . /usr/src/symfony_tutorial
WORKDIR /usr/src/symfony_tutorial
CMD ["php", "-S", "0.0.0.0:8080"]