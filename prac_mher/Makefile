NAME = inception


# $(NAME) :
# 	@sudo mkdir -p $(VOLUME_PATH)/mariadb/

up	:
	@sudo docker-compose -f ./srcs/docker-compose.yml up --build -d

down	:
	@sudo docker-compose -f ./srcs/docker-compose.yml down

clean	:
	@sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes

.PHONY	: all down clean