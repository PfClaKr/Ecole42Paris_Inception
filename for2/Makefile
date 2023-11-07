COMPOSE_YAML = srcs/docker-compose.yaml
VOLUME = ./ychun/data

all:
	mkdir -p $(VOLUME)
	mkdir -p $(VOLUME)/mariadb
	mkdir -p $(VOLUME)/wordpress
	sudo docker-compose --file=$(COMPOSE_YAML) up -d --build


up:
	sudo docker-compose --file=$(COMPOSE_YAML) up -d --build
clean:
	sudo docker-compose --file=$(COMPOSE_YAML) down
fclean: clean
	sudo docker-compose --file=$(COMPOSE_YAML) down --volumes
	sudo docker container prune
	sudo docker image prune
	sudo docker volume prune
	sudo rm -rf ./ychun
mariadb:
	sudo docker-compose --file=$(COMPOSE_YAML) exec mariadb /bin/bash
wordpress:
	sudo docker-compose --file=$(COMPOSE_YAML) exec wordpress /bin/bash
nginx:
	sudo docker-compose --file=$(COMPOSE_YAML) exec nginx /bin/bash
mariadb_log:
	sudo docker logs --tail 30 mariadb
wordpress_log:
	sudo docker logs --tail 30 wordpress
nginx_log:
	sudo docker logs --tail 30 nginx
