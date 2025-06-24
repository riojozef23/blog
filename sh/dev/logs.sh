#!/bin/bash

# Path ke docker-compose file relatif dari script ini
SOURCE="${BASH_SOURCE[2]:-${BASH_SOURCE[0]}}"
SCRIPT_DIR="$( cd "$( dirname "$SOURCE" )/../.." && pwd )"
COMPOSE_FILE="$SCRIPT_DIR/docker-compose-dev.yaml"

docker compose -f "$COMPOSE_FILE" logs -f
