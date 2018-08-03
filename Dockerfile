FROM alpine:3.7

RUN apk add --no-cache curl

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]