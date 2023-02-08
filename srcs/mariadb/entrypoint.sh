#!/bin/bash

service mysql start;        #Start mysql
mysql -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DB_NAME\`;"  #Cree la Database et lu donne le nom du .env
mysql -e "CREATE USER IF NOT EXISTS \`$MYSQL_USER\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"   #Cree l'user 
mysql -e "GRANT ALL PRIVILEGES ON \`$MYSQL_DB_NAME\`.* TO \`$MYSQL_USER\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD}';" # Lui donne tout les droits sur la DB
mysql -e "FLUSH PRIVILEGES;" #update aevc tt au dessus

mysqladmin -u root -p $MYSQL_ROOT_PASSWORD shutdown
exec mysqld_safe