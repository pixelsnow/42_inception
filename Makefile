all: up

re: fclean all

# Creates data directories
prepare:
	mkdir -p /Users/${USER}/data/wordpress
	mkdir -p /Users/${USER}/data/mariadb

# Builds the Docker Compose project
build: prepare
	docker compose -f srcs/docker-compose.yml build

# Starts the Docker Compose project
up: build
	docker compose -f srcs/docker-compose.yml up

# Get the list of Docker container IDs
CONTAINERS := $(shell docker ps -aq)

# Get the list of Docker image IDs
IMAGES := $(shell docker images -aq)

# Removes all Docker containers (including volumes and running containers) and images
clean:
	#ifneq ($(CONTAINERS),)
		docker rm -vf $(CONTAINERS)
	#endif
	#ifneq ($(IMAGES),)
		docker rmi -f $(IMAGES)
	#endif

# Removes data directories
fclean: clean
	rm -rf /Users/${USER}/data/wordpress
	rm -rf /Users/${USER}/data/mariadb

.PHONY: all build up re clean fclean prepare