stack-stop:
	docker stack rm my_wordpress

stack-deploy:
	docker stack deploy -c docker-stack.yml my_wordpress

recreate: 
	sed -i -e 's/example.com/wp.loc/g' ./docker-stack.yml
	rm -rf ./data
	mkdir -p ./data/{wp,mysql,letsencrypt}_data
	# docker network rm nw-backend
	# docker network rm nw-web
	docker network create --driver overlay --scope swarm nw-web
	docker network create --driver overlay --scope swarm nw-backend
