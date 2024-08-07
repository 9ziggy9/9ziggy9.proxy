.PHONY: start_server start_host kill_server zrok_shell docker_build

up:
	docker-compose build --no-cache
	docker-compose up

share:
	zrok share reserved 9ziggy9

docker: docker_build
	docker container rm 9ziggy9.proxy
	docker run -p 9001:9001 --name 9ziggy9.proxy --network=host 9ziggy9.proxy

docker_build:
	docker build --no-cache -t 9ziggy9.proxy .

kill_server:
	fuser -k -n tcp $(PORT)
