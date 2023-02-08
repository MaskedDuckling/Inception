all:	bind_mount
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@sudo docker-compose -f ./srcs/docker-compose.yml down

fclean: clean
	@sudo rm -rf /home/$(USER)/data/wordpress
	@sudo rm -rf /home/$(USER)/data/mariadb
	@sudo docker system prune -a --volumes

re: fclean all

bind_mount:
	@mkdir -p /home/$(USER)/data
	@mkdir -p /home/$(USER)/data/mariadb
	@mkdir -p /home/$(USER)/data/wordpress

.PHONY: all fclean clean bind_mount