
NAME = Inception

all: fclean up
# setup

# setup:
# 	cd ./srcs/requirements/tools && sudo bash pre_work.sh

up:
	docker compose -f ./srcs/docker-compose.yml up;
.PHONY: up

down:
	docker compose -f ./srcs/docker-compose.yml down;
.PHONY: down

clean:
	docker stop $(docker ps -aq); docker rm $(docker ps -aq); docker image prune -a; docker volume rm $(docker volume ls -q); docker system prune -af
.PHONY: stop

fclean: clean
	rm -rf ./srcs/requirements/tools/mariadb/*
	rm -rf ./srcs/requirements/tools/wordpress/*
.PHONY: fclean
# remove files from the volumes (you need to fill it)
# you need to change directory!!! to /home/data/
