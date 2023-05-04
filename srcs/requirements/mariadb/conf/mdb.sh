#!/bin/sh

DB_NAME="${DB_NAME:-saad}"
DB_USER="${DB_USER:-NEO}"
DB_PASSWORD="${DB_PASSWORD:-neomood02}"

service mysql start

if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME} ;"
    mysql -u root -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}' ;"
    mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' ;"
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;"
    # mysql -u root -p12345 -e "FLUSH PRIVILEGES;"
fi

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
kill $(pidof mysqld)

# service mysql stop

# mysqld_safe
# exec "$@"
mysqld 