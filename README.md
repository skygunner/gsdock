# Dockerized GoodSync server

[GoodSync](https://www.goodsync.com) Connect provides server discovery through central registry, NAT/firewall traversal to provide file access and synchronization, making it very easy to populate/update/backup docker volumes after deployment.

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

3. Open GoodSync or GsExlorer on Mac/Win/mobile, enter credentials for GoodSync Connect - all containers/servers running under this account should be visible and allow file transfer and sync. On Linux, GoodSync is good with some Wine.

4. If you wish to view the configuration UI, visit http://<ip>:11000/

