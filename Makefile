NAME = inception
DOWN = down
PR = prune
RM_V = rmv

all: ${NAME}

${NAME}:
	if [ ! -d "/home/adylewsk/data" ]; then \
	sudo mkdir /home/adylewsk/data; \
	fi
	if [ ! -d "/home/adylewsk/data/mariadb" ]; then \
	sudo mkdir /home/adylewsk/data/mariadb; \
	fi
	if [ ! -d "/home/adylewsk/data/wordpress" ]; then \
	sudo mkdir /home/adylewsk/data/wordpress; \
	fi
	$(docker ps | wc -l)
	if [ $(shell docker ps | wc -l) -ne $(shell echo "4") ]; then \
	docker-compose -f srcs/docker-compose.yml up --build; \
	else echo "is runing"; \
	fi

${DOWN}:
	docker-compose -f srcs/docker-compose.yml down

${PR}:
	docker system prune -a -f

${RM_V}:
	sudo rm -rf /home/adylewsk/data

clean: ${DOWN} ${PR}

fclean: clean ${RM_V}

re: fclean all
