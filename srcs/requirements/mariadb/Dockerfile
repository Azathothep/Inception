#syntax=docker/dockerfile:1
FROM debian:buster

ARG MARIADB_DATABASE
ARG MARIADB_USER
ARG MARIADB_PASSWORD
ARG MARIADB_ROOT_PASSWORD

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install mariadb-server -y

WORKDIR /mariadb
COPY conf conf

RUN sh conf/init.sh

EXPOSE 3306

ENTRYPOINT ["mysqld", "--bind-address=0.0.0.0"]