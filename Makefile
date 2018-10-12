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

.PHONY: gobgp_1
gobgp_1:
	docker exec -it pygobgp-example_gobgp_1_1 /bin/bash

.PHONY: gobgp_2
gobgp_2:
	docker exec -it pygobgp-example_gobgp_2_1 /bin/bash

.PHONY: controller
controller:
	docker exec -it pygobgp-example_gobgp_control_1 /bin/bash
