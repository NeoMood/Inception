#!/bin/sh

service mysql start

if [ ! -d "/var/lib/mysql/saad" ]; then
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS saad ;"
    mysql -u root -e "CREATE USER IF NOT EXISTS 'NEO'@'%' IDENTIFIED BY 'neomood02' ;"
    mysql -u root -e "GRANT ALL PRIVILEGES ON saad.* TO 'NEO'@'%' ;"
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;"
    # mysql -u root -p12345 -e "FLUSH PRIVILEGES;"
fi

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
kill $(pidof mysqld)

# service mysql stop

# mysqld_safe
# exec "$@"
mysqld 