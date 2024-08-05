all: up

re: fclean all

prepare:
	mkdir -p srcs/home/lera/data/wordpress
	mkdir -p srcs/home/lera/data/mariadb

build: prepare
	docker compose -f srcs/docker-compose.yml build

up: build
	docker compose -f srcs/docker-compose.yml up

clean:
	docker rm -vf $$(docker ps -aq)
	docker rmi -f $$(docker images -aq)

fclean: clean
	rm -rf srcs/home/lera/data/wordpress
	rm -rf srcs/home/lera/data/mariadb

.PHONY: all build up re clean fclean prepare