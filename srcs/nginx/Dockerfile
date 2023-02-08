FROM debian:buster 

RUN apt-get update && apt-get upgrade -y

RUN  apt-get install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -newkey rsa:4096 -days 42 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=eydupray.42.fr/UID=eydupray" 

COPY src/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]
