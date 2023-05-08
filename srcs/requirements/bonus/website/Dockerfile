FROM debian:buster

RUN apt-get update -y && apt-get install -y nginx

COPY /website_files/default /etc/nginx/sites-enabled

COPY /website_files/index.html /tmp

CMD ["nginx", "-g", "daemon off;"]