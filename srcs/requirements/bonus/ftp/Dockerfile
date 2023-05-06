FROM debian:buster

RUN apt-get update && apt-get install -y vsftpd

COPY conf/vsftpd.conf /etc/vsftpd.conf

EXPOSE 20 21

CMD ["vsftpd", "/etc/vsftpd.conf"]