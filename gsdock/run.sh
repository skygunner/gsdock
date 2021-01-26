#!/bin/bash

SVC=${PWD##*/}
PORT=33333

docker rm -f $SVC

docker rmi $SVC

docker build -t $SVC . || exit 1

docker run --rm -it \
	-p $PORT:$PORT \
  -p '11000:11000/tcp' \
  -p '33338:33338/udp' \
  -p '33339:33339/udp' \
  --name $SVC \
  -e PORT=$PORT \
  -e GS_USER=$1 \
  -e GS_PWD=$2 \
  -e GS_ID=gsdockrun \
  -v $(pwd)/data:/data \
  -v $(pwd)/config:/config \
  $SVC $3
