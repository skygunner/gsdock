# Dockerized GoodSync server

[GoodSync](https://www.goodsync.com) Connect provides server discovery through central registry, NAT/firewall traversal to provide file access and synchronization, making it very easy to populate/update/backup docker volumes after deployment.

When run, the **latest available 64-bit** release will be downloaded from the GoodSync website. As of the latest push, GSTP protocol version 3 is supported.

## Usage: 

1. Register [GoodSync Connect account](https://www.goodsync.com/gs-connect)

2. Start the container with:
    ```
    docker run 
        -p 33333:33333 \
        -p 11000:11000 \
        -e GS_USER=<user> \
        -e GS_PWD=<password> \
        -e GS_ID=<deploy_name> \
        -v $(pwd)/data:/data \
        -v $(pwd)/config:/root/.goodsync \
        shrmn/gsdock
    ```
    where `<user>` and `<password>`  are from the step 1, optional `<deploy_name>` will identify the container in GoodSync Connect `gstp://<deploy_name>.<user>.goodsync`, and everything mounted in `/data` will be accessible through it.
    Also note that /config will contain all the configuration files for you to edit if you wish

3. Open GoodSync or GsExplorer on macOS/Windows/Mobile, enter credentials for GoodSync Connect - all containers/servers running under this account should be visible and allow file transfer and sync. Linux users should [view the various linux packages available on the GoodSync website](https://www.goodsync.com/for-linux).

4. If you wish to view the configuration UI, visit http://[IP]:11000/
