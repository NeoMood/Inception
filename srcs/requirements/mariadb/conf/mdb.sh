#!/bin/sh

service mysql start

if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME} ;"
    mysql -u root -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}' ;"
    mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' ;"
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}' ;"
fi

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
kill $(pidof mysqld)

mysqld