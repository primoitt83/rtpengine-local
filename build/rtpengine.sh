#!/bin/sh

## Load rtpengine driver on kernel
modprobe xt_RTPENGINE

## Rtpengine packet forwarding to table=0
if [ ! -d "/proc/rtpengine/0" ]
then
    ## does not exists, lets create
    echo 'add 0' > /proc/rtpengine/control
fi

## Add iptables
iptables -A INPUT -p udp --dport 10000:20000 -j ACCEPT
iptables -I INPUT -p udp -j RTPENGINE --id 0

## Send ips from env to conf file
sed -i "s/IPINTERNO/$IPINTERNO/g" /rtpengine.conf
sed -i "s/IPEXTERNO/$IPEXTERNO/g" /rtpengine.conf

## Send ports from env to conf file
sed -i "s/PORT_MIN/$PORT_MIN/g" /rtpengine.conf
sed -i "s/PORT_MAX/$PORT_MAX/g" /rtpengine.conf

## Execute rtpengine
rtpengine -p /var/run/rtpengine.pid  --config-file=/rtpengine.conf --log-level=6 --log-stderr --foreground