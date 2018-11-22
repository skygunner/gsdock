# Dockerized GoodSync Server

### First Installation: Please restart container right after first boot to apply settings!

[GoodSync](https://www.goodsync.com) Connect provides server discovery through central registry, NAT/firewall traversal to provide file access and synchronization, making it very easy to populate/update/backup docker volumes after deployment.

When run, the **latest available 64-bit** release will be downloaded from the GoodSync website.

As of October 2018 build, GSTP protocol version 3 is supported.

## Updates to Configuration (22 November 2018)

Our base image is now [lsiobase/ubuntu:xenial](https://github.com/linuxserver/docker-baseimage-ubuntu), which meant moving configuration files to `/config` within the container.

In order to effect this change, some changes were needed:
- **Container** path changed from `/root/.goodsync` to `/config`
- Added `PUID` and `PGID` variables (99 and 100 respectively) to ensure files do not end up with root permissions
- Default networking mode is now `host` instead of `bridge`, to effectively enable LAN Discovery.

Unraid users - Changes to the docker-template XML was done to reflect some internal changes in how the docker image is created. If you are unsure on how to change your settings, I suggest deleting the docker app, then re-downloading from CA. Your data will remain safe as long as you point your folders (data folder and appdata folder) back to the same as before.

# Usage: 

1. Register [GoodSync Connect account](https://www.goodsync.com/gs-connect)

2. Start the container with:
    ```
    docker run 
        -p '33333:33333/tcp' \
        -p '11000:11000/tcp' \
        -p '33338:33338/udp' \
        -p '33339:33339/udp' \
        -e GS_USER=<user> \
        -e GS_PWD=<password> \
        -e GS_ID=<deploy_name> \
        -v $(pwd)/data:/data \
        -v $(pwd)/config:/root/.goodsync \
        shrmn/gsdock
    ```
    where `<user>` and `<password>`  are from the step 1, optional `<deploy_name>` will identify the container in GoodSync Connect `gstp://<deploy_name>.<user>.goodsync`, and everything mounted in `/data` will be accessible through it.
    Also note that /config will contain all the configuration files for you to edit if you wish

3. **Restart container right after first boot to apply settings!**

4. Open GoodSync or GsExplorer on macOS/Windows/Mobile, enter credentials for GoodSync Connect - all containers/servers running under this account should be visible and allow file transfer and sync. Linux users should [view the various linux packages available on the GoodSync website](https://www.goodsync.com/for-linux). 

5. Your gsdock container will appear as `$GS_ID` or your container name (hostname). 

6. If you wish to view the configuration UI, visit http://[IP]:11000/

---

# Development

This app is based closely to how linuxserver.io's apps are done. Even the base image is using their Ubuntu (Xenial) image. (s6-overlay)[https://github.com/just-containers/s6-overlay] is used to simplify management of scripts and ensure that permissions are properly used by both the configuration scripts and the gs-server app.

In order to get running, you can try running `run.sh` or looking through its contents.

Scripts are located in `/root/etc/cont-init.d`
