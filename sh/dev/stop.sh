#!/bin/bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

CONTAINERS=(
  "laravel_blog"
  "nginx_blog"
  "composer_blog"
  "node_blog"
  "mysql_blog"
)

echo -e "${BLUE}🛑 Stopping all related containers...${NC}"

for container in "${CONTAINERS[@]}"; do
  if docker ps -q -f name="^${container}$" > /dev/null; then
    echo -e "Stopping container: ${container} ..."
    docker stop "$container"
  else
    echo -e "Container ${container} is not running."
  fi
done

echo -e "\n${GREEN}✅ All specified containers stopped (if they were running).${NC}"
