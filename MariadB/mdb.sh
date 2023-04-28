#!/bin/sh

service mysql start

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
# sed -i 's/bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
mysql -e "CREATE DATABASE IF NOT EXISTS saad ;"
mysql -e "CREATE USER IF NOT EXISTS 'NEO'@'%' IDENTIFIED BY 'neomood02' ;"
mysql -e "GRANT ALL PRIVILEGES ON saad.* TO 'NEO'@'%' ;"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;"
mysql -e "FLUSH PRIVILEGES;"

# service mysql stop

# tail -f /dev/null
# mysqld_safe
mysqld 