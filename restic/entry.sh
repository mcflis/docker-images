#!/usr/bin/env sh

# original repo  : https://github.com/lobaro/restic-backup-docker
# original source: https://github.com/lobaro/restic-backup-docker/blob/820fabb1e69a05eb329250dfcfe3f0ce8cecc81e/entry.sh

echo "Starting container ..."

if [ -n "${NFS_TARGET}" ]; then
  echo "Mounting NFS based on NFS_TARGET: ${NFS_TARGET}"
  sh -c "mount -o nolock -v ${NFS_TARGET} /mnt/restic"
fi

sh -c "restic snapshots ${RESTIC_INIT_ARGS} > /dev/null 2>&1"
status=$?
echo "Check Repo status $status"

if [ $status != 0 ]; then
  echo "Restic repository '${RESTIC_REPOSITORY}' does not exists. Running restic init."
  sh -c "restic init ${RESTIC_INIT_ARGS}"

  init_status=$?
  echo "Repo init status $init_status"

  if [ "$init_status" -ne 0 ]; then
    echo "Failed to init the repository: '${RESTIC_REPOSITORY}'"
    exit 1
  fi
fi

echo "Setup backup cron job with cron expression BACKUP_CRON: ${BACKUP_CRON}"
RUN_ON_STARTUP_BACKUP_CMDLINE="/usr/bin/flock -n /var/run/backup.lock /bin/backup"
BACKUP_CMDLINE="$RUN_ON_STARTUP_BACKUP_CMDLINE >> /var/log/cron.log 2>&1"
BACKUP_CRONFILE=/var/spool/cron/crontabs/root
echo "${BACKUP_CRON} sh -c '$BACKUP_CMDLINE'" > "$BACKUP_CRONFILE"
echo "Backup cronline: $(cat "$BACKUP_CRONFILE")"

# Make sure the file exists before we start tail
touch /var/log/cron.log

if [ -n "${BACKUP_CRON:-}" ]; then
  if [ "${RUN_ON_STARTUP:-}" = "true" ]; then
    echo "Executing backup on startup ..."
    sh -c "$RUN_ON_STARTUP_BACKUP_CMDLINE"
  fi
  echo "Scheduling backup job according to cron expression."
  # start the cron deamon
  crond

  echo "Container started."

  exec "$@"
else
  echo "ERROR: BACKUP_CRON cannot be empty"
  exit 1
fi
