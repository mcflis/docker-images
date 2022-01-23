# dnsdist-keepalived
A load balancer with dnsdist and keepalived (VRRP) to provide high-availability dns resolving.

## Usage

### Configuration

* Define your dnsdist settings in a file and mount to `/etc/dnsdist/dnsdist.conf`; see [docs](https://www.dnsdist.org/).

* Define your keepalived settings in a file and mount to `/etc/keepalived/keepalived.conf`; see [docs](https://www.mankier.com/5/keepalived.conf).

See the [example](./example) to get started.

### Keepalived
This requires NET_ADMIN privileges: keepalived will run as root (but you can specify user `dnsdist` for the `vrrp_script` directive).\
To get the most out of keepalived, you should run this container with `--net=host` in order to manage host network interfaces.\
Additionally, you will need the ip_vs kernel module and ip_nonlocal set on the host running docker engine:
```
echo ip_vs >>/etc/modules.conf
echo net.ipv4.ip_nonlocal_bind=1 >/etc/sysctl.d/99-haproxy.conf
sysctl -p /etc/sysctl.d/99-haproxy.conf
```

**Note:** If the container is stopped or the docker service is stopped, the virtual ip still might be assigned to the particular node.
In this case you might end up with multiple hosts with the same virtual ip.

### Dnsdist
Dnsdist will run with `--uid dnsdist --gid dnsdist` (see [entrypoint.sh](./entrypoint.sh)).\


## Build and run 
```bash
docker build . -t dnsdist-keepalived
docker run -d \
      --restart always \
      --cap-add=NET_ADMIN \
      -v "$(pwd)/example/keepalived.conf:/etc/keepalived/keepalived.conf" \
      dnsdist-keepalived
```

## Uses
This image is using code / is inspired by

[![](https://img.shields.io/badge/code-acassen%2Fkeepalived-blue.svg)](https://github.com/acassen/keepalived "Code repo")
[![](https://img.shields.io/badge/code-PowerDNS%2Fpdns-blue.svg)](https://github.com/PowerDNS/pdns "Code repo")
[![](https://img.shields.io/badge/code-tcely%2Fdnsdist-blue.svg)](https://github.com/tcely/dockerhub-powerdns "Code repo")
[![](https://img.shields.io/badge/image-instantlinux%2Fhaproxy--keepalived-blue.svg)](https://hub.docker.com/r/instantlinux/haproxy-keepalived "Docker image")

## License
[![](https://img.shields.io/badge/license-GPL--2.0-red.svg)](https://choosealicense.com/licenses/gpl-2.0/ "License badge")\
(differs from the root license)
