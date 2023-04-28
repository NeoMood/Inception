FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

# COPY mdb.conf /etc/mysql/conf.d/mdb.conf
# COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# EXPOSE 3306
COPY mdb.sh /mdb.sh
RUN chmod +x /mdb.sh
CMD ["/mdb.sh"]
# CMD ["bash", "mdb.sh"]
