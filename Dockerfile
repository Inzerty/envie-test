FROM wordpress:6.7-php8.2-apache

RUN apt-get update && apt-get install -y \
    vim \
    curl \
    less \
    unzip \
    git \
    libzip-dev \
    && docker-php-ext-install zip

COPY uploads.ini /usr/local/etc/php/conf.d/uploads.ini
