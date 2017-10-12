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
    -e GS_USER=$1 \
    -e GS_PWD=$2 \
    -e GS_ID=gsdockrun \
    -v $(pwd)/data:/data \
    -v $(pwd)/server:/root/.goodsync/server \
    $SVC $3

#    -v $(pwd)/server:/root/.goodsync/server \
    