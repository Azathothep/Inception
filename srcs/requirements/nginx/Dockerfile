#syntax=docker/dockerfile:1
FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx openssl

WORKDIR /nginx
COPY conf conf

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -sha256 -nodes -days 365 -subj "/C=FR/ST=PACA/L=Lyon/O=42/OU=fbelthoi/CN=localhost" -newkey rsa:4096 -keyout /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt;

COPY conf/nginx.conf /etc/nginx/sites-available/fbelthoi.42.fr.conf
RUN ln -s /etc/nginx/sites-available/fbelthoi.42.fr.conf /etc/nginx/sites-enabled/

EXPOSE 443 9000

ENTRYPOINT ["nginx", "-g", "daemon off;"]