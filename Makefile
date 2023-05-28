all : up

up : 
	@mkdir -p /home/kali/data/mariadb_vol
	@mkdir -p /home/kali/data/web_vol
	@docker-compose -f ./srcs/docker-compose.yml up -d

down : 
	@docker-compose -f ./srcs/docker-compose.yml down -v

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps

clean  : down
	@docker system prune --all --force --volumes