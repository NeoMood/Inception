FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

# EXPOSE 3306
COPY mdb.sh /mdb.sh
RUN chmod +x /mdb.sh
# COPY mdb.sh /usr/local/bin/mdb.sh
# RUN chmod +x /usr/local/bin/mdb.sh
CMD ["/mdb.sh"]
# ENTRYPOINT ["/mdb.sh"]
# CMD ["bash", "mdb.sh"]
