include srcs/.env
export

DOCKER_CONTAINERS	=		$(shell docker ps -a -q)
DOCKER_VOLUMES		=		$(shell docker volume ls -q)

all:
		@[ -d $(DOCKER_DATA) ] || mkdir -p $(DOCKER_DATA)
		@[ -d $(DOCKER_DATA)/db ] || mkdir -p $(DOCKER_DATA)/db
		@[ -d $(DOCKER_DATA)/wordpress ] || mkdir -p $(DOCKER_DATA)/wordpress
		@cd srcs; docker-compose up -d

clean:
ifneq ($(strip $(DOCKER_CONTAINERS)),)
		@docker rm $(DOCKER_CONTAINERS) -f
endif

fclean:
		@rm -rf $(DOCKER_DATA)/*
		@make clean
ifneq ($(strip $(DOCKER_VOLUMES)),)
		@docker volume rm $(DOCKER_VOLUMES)
endif
		@docker system prune -a -f

re:		fclean all

.PHONY:	all clean fclean re
