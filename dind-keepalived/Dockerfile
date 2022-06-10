FROM alpine
MAINTAINER Maximilian Flis "docker@dahoam.cloud"

USER root
RUN apk add --no-cache --update keepalived docker-cli && \
    adduser -D -s /bin/sh keepalived_script && \
    (mv /etc/keepalived/keepalived.conf /etc/keepalived/keepalived.dist || :)

VOLUME /usr/local/etc/keepalived/keepalived.conf

ENTRYPOINT ["/usr/sbin/keepalived", "-f", "/usr/local/etc/keepalived/keepalived.conf", "--dont-fork", "--log-console", "--no-syslog"]
