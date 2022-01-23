#!/usr/bin/env bash

set -e

sed -i -e 's/^module[(]load="imklog"/# module(load="imklog"/' \
       -e 's/^module[(]load="immark"/# module(load="immark"/' /etc/rsyslog.conf
if [ ! -e /etc/rsyslog.d/udp.conf ]; then
  mkdir -p /etc/rsyslog.d
  cat <<EOF > /etc/rsyslog.d/udp.conf
module(load="imudp")
\$UDPServerRun 514
\$UDPServerAddress 127.0.0.1
EOF
fi
> /var/log/messages
rm -f /run/rsyslogd.pid && rsyslogd

#start keepalived
rm -rf /run/keepalived && keepalived
# print logs
tail +1 -f /var/log/messages &

(
  while true; do
    process=keepalived

    pidof "$process" >/dev/null || {
      echo "$process is not running"
      exit 1
    }

    sleep 5
  done
) &

/usr/local/bin/dnsdist --uid dnsdist --gid dnsdist --supervised &

wait -n
exit $?
