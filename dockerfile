FROM alpine:3.18.4

RUN apk update

RUN apk add samba-client

COPY entrypoint.sh /entrypoint.sh

WORKDIR /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoing.sh"]
