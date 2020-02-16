#!/usr/bin/env bash

# The home directory of ran script
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
BIN_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

source ${BIN_DIR}/includes.sh "$@"

echo -e "Restarting ${HIGHLIGHT}${PROJECT_NAME} v${PROJECT_VERSION}${NORMAL} project..."

${BIN_DIR}/down.sh "$@"
${BIN_DIR}/up.sh "$@"
