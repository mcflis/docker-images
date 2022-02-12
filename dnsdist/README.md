# dnsdist
Multi-arch image for dnsdist

## Usage

### Configuration

* Define your dnsdist settings in a file and mount to `/etc/dnsdist/dnsdist.conf`; see [docs](https://www.dnsdist.org/).

### Dnsdist
Dnsdist will run with `--uid dnsdist --gid dnsdist` (see [Dockerfile](./Dockerfile)).

## Build and run 
```bash
docker build . -t dnsdist
docker run -d \
      --name dnsdist \
      -p 15353:53/tcp \
      -p 15353:53/udp \
      --restart always \
      -v "$(pwd)/example/dnsdist.conf:/etc/dnsdist/dnsdist.conf:ro" \
      dnsdist
```

## Uses
This image is using code / is inspired by

[![](https://img.shields.io/badge/code-PowerDNS%2Fpdns-blue.svg)](https://github.com/PowerDNS/pdns "Code repo")
[![](https://img.shields.io/badge/code-tcely%2Fdnsdist-blue.svg)](https://github.com/tcely/dockerhub-powerdns "Code repo")

## License
[![](https://img.shields.io/badge/license-GPL--2.0-red.svg)](https://choosealicense.com/licenses/gpl-2.0/ "License badge")\
(differs from the root license)
