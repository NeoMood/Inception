FROM debian:buster

RUN apt-get update && \
    apt-get install -y \
        php-fpm \
        php-mysqli \
        php-pdo_mysql \
        curl \
        tar \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

