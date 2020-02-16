#!/usr/bin/env bash

# Project directories & paths
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
BIN_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

source ${BIN_DIR}/includes.sh "$@"

echo -e "${HIGHLIGHT}${PROJECT_NAME} v${PROJECT_VERSION}${NORMAL} project stopper."
echo -e "Stopping project for ${HIGHLIGHT}${ENVIRONMENT}${NORMAL} environment..."

cd ${HOME_DIR}
DOCKER_COMPOSE_CONFIG="docker-compose.${ENVIRONMENT}.yml"
if [[ "$ENVIRONMENT" == "dev" ]]; then
	DOCKER_COMPOSE_CONFIG="docker-compose.yml"
	docker-compose stop
else
	docker-compose -f ${DOCKER_COMPOSE_CONFIG} stop
fi

${BIN_DIR}/docker-clean-images.sh
