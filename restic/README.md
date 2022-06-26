# restic
[Restic is a modern backup program that can back up your files.](https://restic.net/)

## Usage

This image is based on [lobaro/restic-backup-docker](https://github.com/lobaro/restic-backup-docker) but takes the
compiled binaries from the [mazzolino/restic](https://github.com/djmaze/resticker) image to add support for ARM.

### Configuration

See [lobaro/restic-backup-docker's README.md](https://github.com/lobaro/restic-backup-docker/blob/master/README.md) for the base configuration.

Additional `ENV` vars

| Env Var          | Value            | Default | Description                                            |
|------------------|------------------|---------|--------------------------------------------------------|
| `RUN_ON_STARTUP` | `true` / `false` | `false` | If `true`, runs the backup cmd once at container start |


## Build and run 
```bash
docker build . -t restic
docker run -d \
       --name=restic-backup \
       --hostname=restic-backup \
       --env=RESTIC_PASSWORD=CHANGE_ME \
       --env=RUN_ON_STARTUP=true \
       restic
```

## Uses
This image is using code / is inspired by

[![](https://img.shields.io/badge/code-restic%2Frestic-blue)](https://github.com/restic/restic "Code repo")
[![](https://img.shields.io/badge/image-lobaro%2Frestic--backup--docker-blue)](https://hub.docker.com/r/lobaro/restic-backup-docker/ "Docker image")
[![](https://img.shields.io/badge/image-mazzolino%2Frestic-blue)](https://hub.docker.com/r/mazzolino/restic/ "Docker image")

## License
[![](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://choosealicense.com/licenses/apache-2.0/ "License badge")\
(differs from the root license)
