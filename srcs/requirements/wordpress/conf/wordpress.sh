#!/bin/sh

if [ -d "/var/www/html/wp-admin" ]; then
  rm -rf /var/www/html/*
fi

mkdir -p /var/www/html
# if ! wp core is-installed --allow-root; then
    wp core download --path=/var/www/html --allow-root
    wp config create --dbhost=mariadb --dbname=saad --dbuser=NEO --dbpass=neomood02  --path=/var/www/html --dbhost=mariadb --allow-root
    wp core install  --url=localhost --title="My WordPress Site" --admin_user=saad --admin_password=saad1233 --admin_email=admin@example.com --path=/var/www/html --skip-email --allow-root
    wp user create neomood neomood.2002@gmail.com --role=author --user_pass=neomood02 --path=/var/www/html --allow-root
    wp theme install astra --activate --path=/var/www/html --allow-root
    wp theme activate astra --path=/var/www/html --allow-root
    echo "\n\nchecking the theme\n\n"
    wp theme list --path=/var/www/html --allow-root
# fi
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf




mkdir -p /run/php/

chmod 755 /run/php/

exec "$@"