#syntax=docker/dockerfile:1
FROM debian:buster

ARG MARIADB_DATABASE
ARG MARIADB_PASSWORD
ARG MARIADB_USER
ARG MARIADB_HOST

RUN apt-get update -y && apt-get upgrade -y 
RUN apt-get install curl -y
RUN apt-get install -y php php-mysql php-fpm

WORKDIR /wordpress
COPY conf conf

EXPOSE 9000 3306

ENTRYPOINT ["sh", "conf/init.sh"]