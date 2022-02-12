# https://github.com/tcely/dockerhub-powerdns
FROM tcely/dnsdist
MAINTAINER Maximilian Flis "docker@dahoam.cloud"

VOLUME /etc/dnsdist/dnsdist.conf
EXPOSE 53/tcp 53/udp

ENTRYPOINT ["/usr/local/bin/dnsdist", "--uid", "dnsdist", "--gid", "dnsdist"]
CMD ["--supervised", "--disable-syslog"]
