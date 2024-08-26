# syntax=docker/dockerfile:1

FROM alpine:3.20.2

RUN apk update && apk add samba-client

COPY entrypoint.sh /entrypoint.sh

WORKDIR /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]