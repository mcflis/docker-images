# https://github.com/tcely/dockerhub-powerdns
FROM tcely/dnsdist
MAINTAINER Maximilian Flis "docker@dahoam.cloud"

RUN mkdir -p /etc/dnsdist
EXPOSE 53/tcp 53/udp

ENTRYPOINT ["/usr/local/bin/dnsdist", "--uid", "dnsdist", "--gid", "dnsdist", "--verbose"]
CMD ["--supervised", "--disable-syslog"]
