
NAME = Inception

VOLUME_PATH :=  /home/jujeon/data
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
	@mkdir -p $(VOLUME_PATH)/wordpress
	@mkdir -p $(VOLUME_PATH)/mariadb
	@docker compose -f ./srcs/docker-compose.yml up --build -d;
	@echo "$(GRN)>>> docker compose up"
.PHONY: up

down:
	@docker compose -f ./srcs/docker-compose.yml down;
	@echo "$(YLW)>>> docker compose down"
.PHONY: down

clean: 
	@docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes
	@echo "$(RED)>>> docker stop and remove volume, networks and caches"
.PHONY: stop

fclean: clean
#	@rm -rf ./srcs/requirements/tools/mariadb/*
#	@rm -rf ./srcs/requirements/tools/wordpress/*
	@rm -rf $(VOLUME_PATH)/mariadb
	@rm -rf $(VOLUME_PATH)/wordpress
	@echo "$(RED)>>> remove your volume files"
.PHONY: fclean
# remove files from the volumes (you need to fill it)
# you need to change directory!!! to /home/data/
