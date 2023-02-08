FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get -y install wget

RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client


# Install wordpress
RUN wget https://fr.wordpress.org/wordpress-6.1.1-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.1.1-fr_FR.tar.gz && rm wordpress-6.1.1-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

#setup php
COPY src/www.conf /etc/php/7.3/fpm/pool.d/www.conf

#setup wordpress with wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY src/setup.sh /usr/local/bin
RUN chmod +x /usr/local/bin/setup.sh
ENTRYPOINT ["bash", "/usr/local/bin/setup.sh"]
