SRCS_DIR = srcs

NAME	= inception

VOLUMES	= $(shell echo | docker volume ls -q)

all:	${NAME}

${NAME}:	
			make clean
			make up

up:			
			docker-compose -f ${SRCS_DIR}/docker-compose.yml up -d --build

down:		
			docker-compose -f ${SRCS_DIR}/docker-compose.yml down

clean:		
			docker system prune -fa

fclean:		clean
ifneq ($(VOLUMES),)
	docker volume rm $(VOLUMES)
	echo inception | sudo -S rm -rf ~/data/mariadb/*
	echo inception | sudo -S rm -rf ~/data/wordpress/*
endif

re:			down fclean all

PHONY= all up down clean fclean re