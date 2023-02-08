FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install wget -y
RUN apt-get install -y php7.3\
						php-fpm\
						php-cli \
						php-mysql \
						php-mbstring \
						php-xml \
						php-mysql \
						&& mkdir /run/php
RUN apt-get install mariadb-client -y

RUN wget https://wordpress.org/wordpress-5.8.3.tar.gz -P /var/www  && cd /var/www \
	&& tar -xvzf wordpress-5.8.3.tar.gz \
	&& rm -rf wordpress-5.8.3.tar.gz

RUN	chown -R root:root /var/www/wordpress

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/docker-entrypoint.sh

COPY wp-config.php /
RUN mkdir -p /var/www/html 

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]

CMD [ "/usr/sbin/php-fpm7.3", "-F" ]