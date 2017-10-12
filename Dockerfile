# goodsync/Dockerfile
FROM debian:jessie-slim
MAINTAINER And Grin <grin@grin.ly>

WORKDIR /gs
ADD http://www.goodsync.com/download/goodsync-release-x86_64.tar.gz /gs/goodsync-release-x86_64.tar.gz
RUN tar xvzf goodsync-release-x86_64.tar.gz --strip-components=1 && \
		rm /gs/goodsync-release-x86_64.tar.gz

# root filesystem
COPY rootfs /

EXPOSE 33333

# Run GS
CMD ["/gs/gsserver.sh"]
