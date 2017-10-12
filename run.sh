#!/bin/bash

SVC=${PWD##*/}
PORT=33333

docker rm -f $SVC

docker rmi $SVC

docker build -t $SVC . || exit 1

docker run --rm -it \
	-p $PORT:$PORT \
    --name $SVC \
    -e PORT=$PORT \
    -e GOODSYNC_USER=$1 \
    -e GOODSYNC_PWD=$2 \
    -e GOODSYNC_ID=gsdockrun \
    -v $(pwd)/data:/data \
    -v $(pwd)/server:/root/.goodsync/server \
    $SVC $3

#    -v $(pwd)/server:/root/.goodsync/server \
    