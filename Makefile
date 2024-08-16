all: up

re: fclean all

# Creates data directories
prepare:
	mkdir -p /home/${USER}/data/wordpress
	mkdir -p /home/${USER}/data/mariadb

# Builds the Docker Compose project
build: prepare
	docker compose -f srcs/docker-compose.yml build

# Starts the Docker Compose project
up: build
	docker compose -f srcs/docker-compose.yml up

# Removes all Docker containers (including volumes and running containers) and images
clean:
	docker system prune -f

# Removes data directories
fclean: clean
	docker system prune -f --volumes
	rm -rf /home/${USER}/data/wordpress
	rm -rf /home/${USER}/data/mariadb

.PHONY: all build up re clean fclean prepare