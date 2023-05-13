#!/bin/sh

# DB_NAME="${DB_NAME:-saad}"
# DB_USER="${DB_USER:-NEO}"
# DB_PASSWORD="${DB_PASSWORD:-neomood02}"
# SITE_TITLE="${SITE_TITLE:-My WordPress Site}"
# ADMIN_USER="${ADMIN_USER:-saad}"
# ADMIN_PASSWORD="${ADMIN_PASSWORD:-saad1233}"
# ADMIN_EMAIL="${ADMIN_EMAIL:-admin@example.com}"
# NEW_USER="${NEW_USER:-neomood}"
# NEW_USER_EMAIL="${NEW_USER_EMAIL:-neomood.2002@gmail.com}"
# NEW_USER_PASSWORD="${NEW_USER_PASSWORD:-neomood02}"

if [ -d "/var/www/html/wp-admin" ]; then
  rm -rf /var/www/html/*
fi

mkdir -p /var/www/html
# if ! wp core is-installed --allow-root; then
    wp core download --path=/var/www/html --allow-root
    wp config create --dbhost=mariadb --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASSWORD" --path=/var/www/html --dbhost=mariadb --allow-root
    wp core install  --url=localhost --title="$SITE_TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL" --path=/var/www/html --skip-email --allow-root
    wp user create "$NEW_USER" "$NEW_USER_EMAIL" --role=author --user_pass="$NEW_USER_PASSWORD" --path=/var/www/html --allow-root
    wp theme install astra --activate --path=/var/www/html --allow-root
    wp theme activate astra --path=/var/www/html --allow-root
    # echo "\n\nchecking the theme\n\n"
    # wp theme list --path=/var/www/html --allow-root
# fi

# Set up Redis Object Cache plugin
wp plugin install redis-cache --activate --path=/var/www/html --allow-root
wp redis enable --path=/var/www/html --allow-root

# Configure Redis Object Cache
wp config set WP_REDIS_HOST 'redis' --path=/var/www/html --allow-root
wp config set WP_REDIS_PORT '6379' --path=/var/www/html --allow-root
wp config set WP_REDIS_DATABASE '0' --path=/var/www/html --allow-root
wp config set WP_CACHE_KEY_SALT 'your-unique-salt-here' --path=/var/www/html --allow-root

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php/
chmod 755 /run/php/

exec "$@"
