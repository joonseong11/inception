
NAME = Inception

RED			=	\033[0;31m
GRN			= 	\033[0;32m
YLW			=	\033[0;33m
BLU			= 	\033[0;36m
DFT			= 	\033[0;37m

all: fclean up
# setup

# setup:
# 	cd ./srcs/requirements/tools && sudo bash pre_work.sh

up:
	@docker compose -f ./srcs/docker-compose.yml up --build -d;
	@echo "$(GRN)>>> docker compose up"
.PHONY: up

down:
	@docker compose -f ./srcs/docker-compose.yml down;
	@echo "$(YLW)>>> docker compose down"
.PHONY: down

clean: down
	@docker stop $(docker ps -aq); docker rm $(docker ps -aq); docker image prune -a; docker volume rm $(docker volume ls -q); docker system prune -af
	@echo "$(RED)>>> docker stop and remove volume, networks and caches"
.PHONY: stop

fclean: clean
	@rm -rf ./srcs/requirements/tools/mariadb/*
	@rm -rf ./srcs/requirements/tools/wordpress/*
	@echo "$(RED)>>> remove your volume files"
.PHONY: fclean
# remove files from the volumes (you need to fill it)
# you need to change directory!!! to /home/data/
