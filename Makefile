all:	bind_mount
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d

clean:
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env down

fclean: clean
	@docker system prune -a --volumes

re: fclean all

bind_mount:
	@mkdir -pv /home/$(USER)/data/mariadb
	@mkdir -pv /home/$(USER)/data/wordpress

.PHONY: all fclean clean bind_mount