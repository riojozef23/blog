# Makefile

# Development
build:
	./sh/dev/build.sh build dev

start:
	./sh/dev/start.sh start dev

stop:
	./sh/dev/stop.sh stop dev

laravel-shell:
	docker exec -it laravel_blog sh

composer-shell:
	docker exec -it composer_blog sh

node-shell:
	docker exec -it node_blog sh

nginx-logs:
	docker logs -f nginx_blog

laravel-logs:
	docker logs -f laravel_blog

composer-logs:
	docker logs -f composer_blog

node-logs:
	docker logs -f node_blog

# Production 

build-prod:
	./sh/prod/build.sh build prod

start-prod:
	./sh/prod/start.sh start prod

stop-prod:
	./sh/prod/stop.sh stop prod

