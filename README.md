# Dockerized GoodSync server

GoodSync Connect provides server discovery through central registry, NAT/firewall traversal to provide file access and synchronization, making it very easy to populate/update/backup docker volumes after deployment.

## Usage: 

1. Register [GoodSync Connect account](https://www.goodsync.com/gs-connect)

2. Start the container with:
    ```
    docker run 
        -p 33333:33333 \
        -e GS_USER=<user> \
        -e GS_PWD=<password> \
        -e GS_ID=<deploy_name> \
        -v $(pwd)/data:/data \
        grin/gsdock
    ```

where `<user>` and `<password>`  are from the step 1, optional `<deploy_name>` will identify the container in GoodSync Connect `gstp://<deploy_name>.<user>.goodsync`, and everything mounted in `/data` will be accessible through it.

3. Open GoodSync or GsExlorer on Mac/Win/mobile, enter credentials for GoodSync Connect - all containers/servers running under this account should be visible and allw file transfer and sync. On Linux, GoodSync is good with some Wine.
