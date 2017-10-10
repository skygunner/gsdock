#!/bin/sh -e

#set root password
/gs/gs-server /set-admin=${GOODSYNC_USER}:${GOODSYNC_PWD}

#optionally set home folder
sed -i "/HomeFolder/c HomeFolder=\"/data\"" /root/.goodsync/server/users.tix

#run server
/gs/gs-server /console