#! /bin/sh

IP=`ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/'`


rtpengine --interface=$IP --listen-tcp=$IP:25060 --listen-udp=$IP:12222 --listen-ng=$IP:22222 --listen-cli=$IP:9900 --timeout=60 --silent-timeout=3600 --pidfile=/var/run/ngcp-rtpengine-daemon.pid --port-min=16384 --port-max=16485 --no-fallback --table=-1 --log-level=6 --log-facility=local0 --foreground