#!/bin/sh

if [ -d "/var/www/html/wordpress/wp-admin" ]; then
  rm -rf /var/www/html/wordpress/*
fi

mkdir -p /var/www/html/wordpress
# if ! wp core is-installed --allow-root; then
    wp core download --path=/var/www/html/wordpress --allow-root
    wp config create --dbhost=mariadb --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASSWORD" --path=/var/www/html/wordpress --dbhost=mariadb --allow-root
    wp core install  --url=localhost --title="$SITE_TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL" --path=/var/www/html/wordpress --skip-email --allow-root
    wp user create "$NEW_USER" "$NEW_USER_EMAIL" --role=author --user_pass="$NEW_USER_PASSWORD" --path=/var/www/html/wordpress --allow-root
    wp theme install astra --activate --path=/var/www/html/wordpress --allow-root
    wp theme activate astra --path=/var/www/html/wordpress --allow-root
# fi

# Set up Redis Object Cache plugin
wp plugin install redis-cache --activate --path=/var/www/html/wordpress --allow-root

# Configure Redis Object Cache
wp config set WP_REDIS_HOST 'redis' --path=/var/www/html/wordpress --allow-root
wp config set WP_REDIS_PORT '6379' --path=/var/www/html/wordpress --allow-root
wp config set WP_REDIS_DATABASE '0' --path=/var/www/html/wordpress --allow-root
wp config set WP_CACHE_KEY_SALT "$KEY_SALT" --path=/var/www/html/wordpress --allow-root

# Enable Redis Object Cache
wp redis enable --path=/var/www/html/wordpress --allow-root

# Modify file system permissions
chown -R www-data:www-data /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php/
chmod 755 /run/php/

exec "$@"