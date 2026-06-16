# syntax=docker/dockerfile:1

FROM alpine:3.24.1

RUN apk add --no-cache samba-client

WORKDIR /

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
