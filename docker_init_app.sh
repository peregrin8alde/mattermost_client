#!/bin/sh

APPNAME=$1

docker run \
  -it \
  --rm \
  -u 1000:1000 \
  -v "$PWD":/usr/src \
  -w /usr/src \
  node \
    npx vue create $APPNAME

exit 0
