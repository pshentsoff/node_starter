#!/usr/bin/env bash
#
# Script for cleanup Docker from untagged and broken containers
#

docker ps --filter status=dead --filter status=exited -aq   | xargs docker rm -v
docker images --no-trunc | grep '<none>' | awk '{ print $3 }' | xargs -r docker rmi

