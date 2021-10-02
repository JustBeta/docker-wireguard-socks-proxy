FROM alpine:latest

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
  && apk add --update-cache s6-overlay wireguard-tools dante-server privoxy openresolv curl jq \
  && rm -rf /var/cache/apk/*

COPY /root/ /

ENTRYPOINT "/init"
