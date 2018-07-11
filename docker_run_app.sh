#!/bin/sh

APPNAME=$1
PORT=$2

docker run \
  -d \
  --name ${APPNAME} \
  -u 1000:1000 \
  -p ${PORT}:8080 \
  -v "$PWD/${APPNAME}":/usr/src/${APPNAME} \
  -w /usr/src/${APPNAME} \
  node \
    yarn serve

exit 0
