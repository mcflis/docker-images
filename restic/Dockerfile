# Get cross-plattform restic binary
# See https://github.com/djmaze/resticker for more info
FROM mazzolino/restic:1.6.0 as restic

FROM alpine:3
MAINTAINER Maximilian Flis "docker@dahoam.cloud"

# original repo  : https://github.com/lobaro/restic-backup-docker
# original source: https://github.com/lobaro/restic-backup-docker/blob/820fabb1e69a05eb329250dfcfe3f0ce8cecc81e/Dockerfile

RUN apk add --update --no-cache heirloom-mailx fuse curl ca-certificates nfs-utils openssh-client tzdata gzip

COPY --from=restic /usr/local/bin/restic /usr/local/bin/rclone /usr/local/bin/

RUN \
    mkdir -p /mnt/restic /var/spool/cron/crontabs /var/log; \
    touch /var/log/cron.log;

ENV RESTIC_REPOSITORY=/mnt/restic
ENV RESTIC_PASSWORD=""
ENV RESTIC_TAG=""
ENV NFS_TARGET=""
ENV BACKUP_CRON="0 */6 * * *"
ENV RESTIC_INIT_ARGS=""
ENV RESTIC_FORGET_ARGS=""
ENV RESTIC_JOB_ARGS=""
ENV MAILX_ARGS=""
ENV OS_AUTH_URL=""
ENV OS_PROJECT_ID=""
ENV OS_PROJECT_NAME=""
ENV OS_USER_DOMAIN_NAME="Default"
ENV OS_PROJECT_DOMAIN_ID="default"
ENV OS_USERNAME=""
ENV OS_PASSWORD=""
ENV OS_REGION_NAME=""
ENV OS_INTERFACE=""
ENV OS_IDENTITY_API_VERSION=3

# openshift fix
RUN mkdir /.cache && \
    chgrp -R 0 /.cache && \
    chmod -R g=u /.cache && \
    chgrp -R 0 /mnt && \
    chmod -R g=u /mnt && \
    chgrp -R 0 /var/spool/cron/crontabs/root && \
    chmod -R g=u /var/spool/cron/crontabs/root && \
    chgrp -R 0 /var/log/cron.log && \
    chmod -R g=u /var/log/cron.log

# /data is the dir where you have to put the data to be backed up
VOLUME /data

COPY backup.sh /bin/backup
COPY entry.sh /entry.sh

WORKDIR "/"

ENTRYPOINT ["/entry.sh"]
CMD ["tail","-fn0","/var/log/cron.log"]
