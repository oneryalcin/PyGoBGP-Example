DOCKERPATH = docker

DOCKER_COMPOSE = docker-compose.yml

.PHONY: build
build:
	docker-compose -f $(DOCKER_COMPOSE) build

.PHONY: up
up:
	docker-compose -f $(DOCKER_COMPOSE) up -d

.PHONY: down
down:
	docker-compose -f $(DOCKER_COMPOSE) down

