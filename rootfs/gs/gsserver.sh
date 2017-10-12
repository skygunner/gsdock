#!/bin/sh -e

#create default options
/gs/gs-server -v
sed -i "/LogLevel/c LogLevel = 0" /root/.goodsync/server/settings.tix
sed -i "/ConsoleLevel/c ConsoleLevel = 4" /root/.goodsync/server/settings.tix
sed -i "/RetainLogDays/c RetainLogDays = 1" /root/.goodsync/server/settings.tix
sed -i "/SSLCertificatePath/c SSLCertificatePath = \"/gs/gs-server.crt\"" /root/.goodsync/server/settings.tix
sed -i "/SSLPrivateKeyPath/c SSLPrivateKeyPath = \"/gs/gs-server.key\"" /root/.goodsync/server/settings.tix
sed -i "/GlobalDiscovery/c GlobalDiscovery = Yes" /root/.goodsync/server/settings.tix
sed -i "/WebUiServer/c WebUiServer = No" /root/.goodsync/server/settings.tix

#set root password
/gs/gs-server /set-admin=${GOODSYNC_USER}:${GOODSYNC_PWD}

#optionally set home folder
sed -i "/HomeFolder/c HomeFolder = \"/data\"" /root/.goodsync/server/users.tix

#run server
/gs/gs-server