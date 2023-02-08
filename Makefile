PATH_YML = ./srcs/docker-compose.yml

all:
	@mkdir -p /home/vboxuser/data
	@mkdir -p /home/vboxuser/data/wordpress
	@mkdir -p /home/vboxuser/data/mariadb
	@sudo docker-compose -f $(PATH_YML) up -d --build

re: clean all

stop:
	@sudo docker-compose -f $(PATH_YML) stop

clean: stop
	@sudo docker-compose -f $(PATH_YML) down -v

fclean: clean
	@sudo rm -rf /home/vboxuser/data/wordpress
	@sudo rm -rf /home/vboxuser/data/mariadb
	@sudo docker system prune -af
