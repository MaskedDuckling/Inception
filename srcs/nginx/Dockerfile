FROM debian:buster

# Installation

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install nginx -y
RUN apt-get install openssl -y

RUN mkdir -p /etc/nginx/ssl

# Obtention du certificat pour l'acces au https

RUN openssl req -x509 -newkey rsa:4096 -days 42 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=eydupray.42.fr/UID=eydupray"

#Notre config nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

#Don des droits sur root

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]