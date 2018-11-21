#!/bin/sh -e

# Create settings.tix file if it does not exist
directory=/root/.goodsync/server
mkdir -p $directory
filename=$directory/settings.tix
test -f $filename || touch $filename

#create default options
/gs/gs-server -v

#change options
sed -i "/LogLevel/c LogLevel = 1" /root/.goodsync/server/settings.tix
sed -i "/ConsoleLevel/c ConsoleLevel = 1" /root/.goodsync/server/settings.tix
sed -i "/RetainLogDays/c RetainLogDays = 1" /root/.goodsync/server/settings.tix
sed -i "/SSLCertificatePath/c SSLCertificatePath = \"/gs/gs-server.crt\"" /root/.goodsync/server/settings.tix
sed -i "/SSLPrivateKeyPath/c SSLPrivateKeyPath = \"/gs/gs-server.key\"" /root/.goodsync/server/settings.tix
sed -i "/GlobalDiscovery/c GlobalDiscovery = Yes" /root/.goodsync/server/settings.tix
sed -i "/WebUiServer/c WebUiServer = Yes" /root/.goodsync/server/settings.tix
sed -i "/WebUiLocalOnly/c WebUiLocalOnly = No" /root/.goodsync/server/settings.tix
sed -i "/GstpManageServer/c GstpManageServer = No" /root/.goodsync/server/settings.tix
sed -i "/GstpFileLocalOnly/c GstpFileLocalOnly = No" /root/.goodsync/server/settings.tix
sed -i "/GstpMapExtPortViaUpnp/c GstpMapExtPortViaUpnp = No" /root/.goodsync/server/settings.tix
sed -i "/GstpExtPort/c GstpExtPort = 33333" /root/.goodsync/server/settings.tix
sed -i "/ComputerId/c ComputerId = \"${GS_ID}\"" /root/.goodsync/server/settings.tix
sed -i "/Receiver/c Receiver = Yes" /root/.goodsync/server/settings.tix

#set root password
/gs/gs-server /set-admin=${GS_USER}:${GS_PWD}

#set home folder
sed -i "/HomeFolder/c HomeFolder = \"file:///data\"" /root/.goodsync/server/users.tix

#run server
/gs/gs-server
