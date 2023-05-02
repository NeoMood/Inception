#!/bin/sh

if [ -d "/var/www/html/wp-admin" ]; then
  rm -rf /var/www/html/*
fi

mkdir -p /var/www/html
# if ! wp core is-installed --allow-root; then
    wp core download --path=/var/www/html --allow-root
    wp config create --dbhost=mariadb --dbname=saad --dbuser=NEO --dbpass=neomood02  --path=/var/www/html --dbhost=mariadb --allow-root
    # echo "\n\n\n\nxxxxxx\n\n\n"
    # wp core install  --url=http://localhost --title="My WordPress Site" --admin_user=admin --admin_password=admin --admin_email=admin@example.com --allow-root
# fi
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf




mkdir -p /run/php/

chmod 755 /run/php/

exec "$@"