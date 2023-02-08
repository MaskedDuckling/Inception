#!bin/bash
sleep 10
if [ ! -e /var/www/wordpress/wp-config.php ]; then
    wp config create    --allow-root --dbname=$MYSQL_WP_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD \
                        --dbhost=mariadb:3306 --path='/var/www/wordpress'

sleep 10
wp core install     --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'
fi

if [ ! -d /run/php ]; then
    mkdir ./run/php
fi
/usr/sbin/php-fpm7.3 -F