COMPOSE_YAML = srcs/docker-compose.yaml

all: srcs/.env up

up:
	docker-compose --file=$(COMPOSE_YAML) up --build -d
down:
	docker-compose --file=$(COMPOSE_YAML) down
clean:
	docker-compose --file=$(COMPOSE_YAML) down
	docker-compose --file=$(COMPOSE_YAML) down --volumes
	docker container prune
	docker image prune
	docker volume prune
	docker-compose --file=$(COMPOSE_YAML) rm -f
	docker-compose --file=$(COMPOSE_YAML) pull
mariadb:
	docker-compose --file=$(COMPOSE_YAML) exec mariadb /bin/bash
wordpress:
	docker-compose --file=$(COMPOSE_YAML) exec wordpress /bin/bash
nginx:
	docker-compose --file=$(COMPOSE_YAML) exec nginx /bin/bash
