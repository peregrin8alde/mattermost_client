#!/bin/sh

docker run \
  -it \
  --rm \
  -u 1000:1000 \
  -v "$PWD":/usr/src \
  -w /usr/src \
  node \
    npm install @vue/cli

exit 0
