# syntax=docker/dockerfile:1

FROM alpine:3.20.3

RUN apk add --no-cache samba-client

WORKDIR /

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
