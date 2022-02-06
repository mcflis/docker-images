# dind-keepalived
Keepalived inside a docker container with `docker-cli`

## Usage

### Configuration

* Define your keepalived settings in a file and mount to `/usr/local/etc/keepalived/keepalived.conf`; see [docs](https://www.mankier.com/5/keepalived.conf).

See the [example](./example) to get started.

### Keepalived
This requires NET_ADMIN privileges: keepalived will run as root (but you can specify user `keepalived_script` for the `vrrp_script` directive).\
To get the most out of keepalived, you should run this container with `--net=host` in order to manage host network interfaces.\
Additionally, you will need the ip_vs kernel module and ip_nonlocal set on the host running docker engine:
```
echo ip_vs >>/etc/modules.conf
echo net.ipv4.ip_nonlocal_bind=1 >/etc/sysctl.d/99-haproxy.conf
sysctl -p /etc/sysctl.d/99-haproxy.conf
```

You might also want to mount the `docker.sock` into the container to check if a particular docker container is running.

**Note:** If the container is stopped or the docker service is stopped, the virtual ip still might be assigned to the particular node.
In this case you might end up with multiple hosts with the same virtual ip.

## Build and run 
```bash
docker build . -t dind-keepalived
docker run -d \
      --restart always \
      --cap-add=NET_ADMIN \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v "$(pwd)/example/keepalived.conf:/usr/local/etc/keepalived/keepalived.conf" \
      dind-keepalived
```

## Uses
[![](https://img.shields.io/badge/code-acassen%2Fkeepalived-blue.svg)](https://github.com/acassen/keepalived "Code repo")
