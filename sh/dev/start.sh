#!/bin/bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Path ke docker-compose file relatif dari script ini
SOURCE="${BASH_SOURCE[2]:-${BASH_SOURCE[0]}}"
SCRIPT_DIR="$( cd "$( dirname "$SOURCE" )/../.." && pwd )"
COMPOSE_FILE="$SCRIPT_DIR/docker-compose-dev.yaml"

PROJECT_NAME="laravel_blog"

echo -e "${BLUE}🚀 Starting all containers for project ${PROJECT_NAME} in detached mode...${NC}"

docker compose -p "$PROJECT_NAME" -f "$COMPOSE_FILE" up -d 

if [ $? -ne 0 ]; then
  echo -e "\n${RED}❌ Failed to start containers. Please check Docker Compose output.${NC}"
  exit 1
fi

echo -e "\n${GREEN}✅ All containers for ${PROJECT_NAME} started successfully! The application is ready.${NC}"
echo

# Tampilkan logs terakhir dari app dan web
echo -e "${BLUE}📄 Last 10 logs for PHP-FPM container (laravel_blog):${NC}"
docker logs --tail=10 laravel_blog

echo -e "\n${BLUE}📄 Last 10 logs for Nginx container (nginx_blog):${NC}"
docker logs --tail=10 nginx_blog

echo -e "\n${BLUE}📄 Last 10 logs for Composer container (composer_blog):${NC}"
docker logs --tail=10 composer_blog

echo -e "\n${BLUE}📄 Last 10 logs for Node container (node_blog):${NC}"
docker logs --tail=10 node_blog

echo -e "\n${BLUE}📄 Last 10 logs for MySQL container (mysql_blog):${NC}"
docker logs --tail=10 mysql_blog

echo -e "\n${YELLOW}💡 To follow full logs for PHP-FPM: docker logs -f laravel_blog"
echo -e "${YELLOW}💡 To follow full logs for Nginx: docker logs -f nginx_blog${NC}"
echo -e "${YELLOW}💡 To follow full logs for Composer: docker logs -f composer_blog"
echo -e "${YELLOW}💡 To follow full logs for Node: docker logs -f node_blog"
echo -e "${YELLOW}💡 To follow full logs for MySQL: docker logs -f mysql_blog"
