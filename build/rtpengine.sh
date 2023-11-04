#! /bin/sh

## Unload rules
iptables --flush

## Reload saved rules
iptables-restore < /etc/iptables/rules.v4

## Send ips from env to conf file
sed -i "s/IPINTERNO/$IPINTERNO/g" /rtpengine.conf
sed -i "s/IPEXTERNO/$IPEXTERNO/g" /rtpengine.conf

## Send ports from env to conf file
sed -i "s/PORT_MIN/$PORT_MIN/g" /rtpengine.conf
sed -i "s/PORT_MAX/$PORT_MAX/g" /rtpengine.conf

## Execute rtpengine
rtpengine -p /var/run/rtpengine.pid  --config-file=/rtpengine.conf --log-level=6 --log-stderr --foreground