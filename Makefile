#NAME		= Inception

#It have to change username before send project include path in .yml file
DB_DIR		= /home/otangkab

SRCS		= ./srcs/docker-compose.yml
DCCP		= docker-compose

all:	pre up

pre:	
	@echo "create directory"
	sudo mkdir -p $(DB_DIR)
	sudo mkdir -p $(DB_DIR)/wordpress
	sudo mkdir -p $(DB_DIR)/mariadb

up:
	$(DCCP) -f $(SRCS) up -d --build

down:
	$(DCCP) -f $(SRCS) down

stop:
	$(DCCP) -f $(SRCS) stop

start:
	$(DCCP) -f $(SRCS) start


clean:	down
	if [ $$(docker images -q | wc -l) -gt 0 ]; \
		then docker image rm -f $$(docker images -qa); fi
	if [ $$(docker volume ls -q | wc -l) -gt 0 ]; \
		then docker volume rm $$(docker volume ls -q); fi

fclean	: clean
	docker system prune -af
	docker volume prune -f

re:	fclean up

.PHONY	: all up down stop start clean fclean re
