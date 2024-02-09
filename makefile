all: logo up

logo :
	@echo " \e[1;34m __    __   ______   __  __   ______    \e[0m"
	@echo " \e[1;34m/\ \"-./  \ /\  __ \ /\ \/ /  /\  ___\   \e[0m"
	@echo " \e[1;34m\ \ \-./\ \\\\\\ \  __ \\\\\\ \  _\"-.\ \  __\   \e[0m"
	@echo " \e[1;34m \ \_\ \ \_\\\\\\ \_\ \_\\\\\\ \_\ \_\\\\\\ \_____\ \e[0m"
	@echo " \e[1;34m  \/_/  \/_/ \/_/\/_/ \/_/\/_/ \/_____/ \e[0m\n\n"

build: 
	@mkdir -p $(HOME)/data/db
	@mkdir -p $(HOME)/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml build

up: build
	@docker compose -f ./srcs/docker-compose.yml up

down:
	@docker compose -f ./srcs/docker-compose.yml down --remove-orphans

stop:
	@docker compose -f ./srcs/docker-compose.yml stop

clean: down
	@docker system prune -af --volumes
	sudo rm -rvf $(HOME)/data

re: clean all

.PHONY: all up clean build mk_data stop down