FROM debian:buster

RUN apt-get update -y && apt-get install -y nginx && apt install openssl -y