# syntax=docker/dockerfile:1

FROM alpine

RUN apk update && apk add \
samba-client

COPY entrypoint.sh /entrypoint.sh

WORKDIR /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
