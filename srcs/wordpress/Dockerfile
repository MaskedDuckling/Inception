FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install wget -y
RUN apt-get install -y php7.3\
						php-fpm\
						php-mysql
RUN apt-get install mariadb-client -y

RUN wget https://wordpress.org/wordpress-5.8.3.tar.gz -P /var/www  && cd /var/www \
	&& tar -xvzf wordpress-5.8.3.tar.gz \
	&& rm -rf wordpress-5.8.3.tar.gz

RUN	chown -R root:root /var/www/wordpress

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

#setup wordpress with wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY conf/docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["bash", "/usr/local/bin/docker-entrypoint.sh "]