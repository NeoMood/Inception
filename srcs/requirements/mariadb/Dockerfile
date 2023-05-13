FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

COPY /conf/mdb.sh /mdb.sh
RUN chmod +x /mdb.sh

CMD ["/mdb.sh"]
