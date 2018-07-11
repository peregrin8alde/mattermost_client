#!/bin/sh

APPNAME=$1
PLUGNAME=$2

docker run \
  -it \
  --rm \
  -u 1000:1000 \
  -v "$PWD":/usr/src \
  -w /usr/src/$APPNAME \
  node \
    ../node_modules/.bin/vue add $PLUGNAME

exit 0
