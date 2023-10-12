# syntax=docker/dockerfile:1

FROM alpine:3

RUN apk update && apk add \
    samba-client \
    nfs-utils

COPY entrypoint.sh /entrypoint.sh

WORKDIR /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
