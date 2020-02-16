#!/usr/bin/env bash

HOME_DIR="$( cd ${BIN_DIR}/../ && pwd)"
SRC_DIR="$( cd ${HOME_DIR}/ && pwd)"

PROJECT_NAME="Node Starter Environment"
PROJECT_VERSION=`cat ${HOME_DIR}/VERSION | grep -o "^[0-9]\{1,2\}\.[0-9]\{1,2\}\.[0-9]\{1,2\}"`
SUPPORTED_ENVIRONMENTS=("dev")
ENVIRONMENT=dev

# Colors
NORMAL="\033[0m"
HIGHLIGHT="\033[0;33m"
ERROR="\e[01;31m"

usage_help() {
	echo "Usage: ./up.sh [options]"
	echo "Options:"
	echo -e "-e | --environment\tUsed environment (dev)."
	echo -e "-h | --help\t\tThis help."
}

in_array() {
	local e match="$1"
	shift
	for e; do [[ "$e" == "$match" ]] && return 1; done
	return 0
}

while [ "$1" ]; do
	case $1 in
		-e | --environment ) shift
						ENVIRONMENT=$1
						;;
		-h | --help )	usage_help
						exit
						;;
		* )				echo -e "${ERROR}Error:${NORMAL} Unknown option: $1"
						usage_help
						exit 1
	esac
	shift
done

in_array "${ENVIRONMENT}" "${SUPPORTED_ENVIRONMENTS[@]}"
if [[ $? == 0 ]]; then
	echo -e "${ERROR}Error:${NORMAL} Environment kind is unknown or unsupported: ${ENVIRONMENT}"
	usage_help
	exit 1
fi
