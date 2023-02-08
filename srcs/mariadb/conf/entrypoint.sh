service mysql start;

mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB_NAME};" -u root -p${MYSQL_ROOT_PASSWORD}
mysql -e "CREATE USER IF NOT EXISTS ${MYSQL_USER}@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" -u root -p${MYSQL_ROOT_PASSWORD}
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB_NAME}.* TO ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" -u root -p${MYSQL_ROOT_PASSWORD}
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" -u root -p${MYSQL_ROOT_PASSWORD}
mysql -e "FLUSH PRIVILEGES;" -u root -p${MYSQL_ROOT_PASSWORD}
mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown

exec mysqld_safe