FROM debian:buster

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y php-fpm php-mysqli curl\
    && apt-get install -y mariadb-server

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/wordpress.sh /

RUN chmod +x /wordpress.sh

ENTRYPOINT ["/wordpress.sh"]

CMD ["/usr/sbin/php-fpm7.3", "-F"]