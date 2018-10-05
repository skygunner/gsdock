# gsdock/Dockerfile

FROM debian:jessie-slim
LABEL maintainer "shrmnk <shrmnk@users.noreply.github.com>"

# Change working directory to gs folder
WORKDIR /gs

# Download latest 64-bit release of GoodSync (Linux)
ADD https://www.goodsync.com/download/goodsync-release-x86_64.tar.gz /gs/goodsync-release-x86_64.tar.gz

# Decompress download archive
RUN mkdir /data &&\
	tar xvzf goodsync-release-x86_64.tar.gz --strip-components=1 &&\
	rm /gs/goodsync-release-x86_64.tar.gz

# Copy over root filesystem for scripts
COPY rootfs /

# Main goodsync protocol port
EXPOSE 33333

# WebUI Port
EXPOSE 11000/tcp

# Map /data to host-defined path for backup storage
VOLUME /data

# Map /root/.goodsync to host-defined config storage folder
VOLUME  "/root/.goodsync"

# Execute server
CMD ["/gs/gsserver.sh"]
