FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN  apt-get install mariadb-server -y

COPY src/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf


# Import and run the script
COPY src/setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup.sh
ENTRYPOINT ["bash", "/usr/local/bin/setup.sh"]

EXPOSE 3306
