all : up

up : 
	@mkdir -p ~/Users/sgmira/Desktop/Data/mariadb_vol
	@mkdir -p ~/Users/sgmira/Desktop/Data/web_vol
	@docker-compose -f ./srcs/docker-compose.yml up -d

down : 
	@docker-compose -f ./srcs/docker-compose.yml down -v

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps

clean  :
	@rm -rf ~/Users/sgmira/Desktop/Data
	@docker system prune --all --force --volumes