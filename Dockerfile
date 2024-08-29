# syntax=docker/dockerfile:1

FROM alpine:3.19.3

RUN apk add --no-cache samba-client

COPY entrypoint.sh /entrypoint.sh

WORKDIR /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
