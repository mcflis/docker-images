# https://github.com/tcely/dockerhub-powerdns
FROM tcely/dnsdist
MAINTAINER Maximilian Flis "docker@dahoam.cloud"

ENV TZ=UTC

USER root
RUN apk add --no-cache --update bash keepalived rsyslog && \
    mv /etc/keepalived/keepalived.conf /etc/keepalived/keepalived.dist

EXPOSE 53/tcp 53/udp
VOLUME /etc/dnsdist/dnsdist.conf /etc/keepalived/keepalived.conf

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
