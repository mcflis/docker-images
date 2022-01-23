# dnsdist-keepalived

## Build and run 
```bash
docker build . -t dnsdist-keepalived
docker run -d \
      --restart always \
      --cap-add=NET_ADMIN \
      -v "$(pwd)/example/keepalived.conf:/etc/keepalived/keepalived.conf" \
      dnsdist-keepalived
```

## Credit where credit's due
- https://github.com/instantlinux/docker-tools/tree/8d2f6ec6360cfede46c083fa640c43705b0afeb4/images/haproxy-keepalived

## Uses
This image is using code / is inspired by

[![](https://img.shields.io/badge/code-acassen%2Fkeepalived-blue.svg)](https://github.com/acassen/keepalived "Code repo")
[![](https://img.shields.io/badge/code-tcely%2Fdnsdist-blue.svg)](https://github.com/tcely/dockerhub-powerdns "Code repo")
[![](https://img.shields.io/badge/code-PowerDNS%2Fpdns-blue.svg)](https://github.com/PowerDNS/pdns "Code repo")
[![](https://img.shields.io/badge/image-instantlinux%2Fhaproxy--keepalived-blue.svg)](https://hub.docker.com/r/instantlinux/haproxy-keepalived "Docker image")

## License
[![](https://img.shields.io/badge/license-GPL--2.0-red.svg)](https://choosealicense.com/licenses/gpl-2.0/ "License badge")\
(differs from the root license)
