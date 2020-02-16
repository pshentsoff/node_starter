#!/usr/bin/env bash

# Version bump
VERSION=`cat $PWD/VERSION | grep -o "^[0-9]\{1,2\}\.[0-9]\{1,2\}\.[0-9]\{1,2\}"`

if (echo "$1" | grep -E -q "^?[0-9]+$"); then
	BUILD=$1
else
	BUILD=$(( `cat $PWD/VERSION | grep -o "[0-9]\{1,2\}$"` + 1 ))
fi

BUILD_VERSION=$VERSION.$BUILD
echo $BUILD_VERSION > $PWD/VERSION
git add $PWD/VERSION