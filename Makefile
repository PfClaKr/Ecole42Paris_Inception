COMPOSE_YAML = srcs/docker-compose.yaml
VOLUME = /home/ychun/data

all:
	sudo mkdir -p $(VOLUME)
	sudo mkdir -p $(VOLUME)/mariadb
	sudo mkdir -p $(VOLUME)/wordpress
	sudo grep ychun.42.fr /etc/hosts || sudo echo "127.0.0.1 ychun.42.fr" >> /etc/hosts
	sudo docker-compose --file=$(COMPOSE_YAML) up -d --build


up:
	sudo docker-compose --file=$(COMPOSE_YAML) up -d --build
clean:
	sudo docker-compose --file=$(COMPOSE_YAML) down
fclean:
	sudo docker-compose --file=$(COMPOSE_YAML) down --rmi all
	@if [ '1' -ne $$(sudo docker volume ls | wc -l) ]; then \
		sudo docker volume rm $$(sudo docker volume ls -f dangling=true -q); \
	fi
clean_data:
	sudo rm -rf $(VOLUME)
re:
	make fclean
	make all
.PHONY: all up re clean clean_data
