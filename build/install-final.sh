#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

apt-get update && apt-get install -y vim gpg wget curl iproute2

apt-get install -y linux-headers-$(uname -r) linux-image-$(uname -r)
apt install -y -t bionic-backports init-system-helpers
apt install -y -t bionic-backports debhelper

apt-get install -y \
    libbencode-perl \
    libcrypt-rijndael-perl \
    libdigest-hmac-perl \
    libio-socket-inet6-perl \
    libsocket6-perl \
    iptables \
    iptables-persistent \
    module-assistant \
    /*.deb

apt-get clean; rm -rf /var/lib/apt/* /tmp/* /var/tmp/* /usr/share/doc/* /*.deb

## Add iptables
iptables -I INPUT -p udp -m udp --dport 5060 -j ACCEPT
iptables -I INPUT -p tcp -m tcp --dport 5060 -j ACCEPT
iptables -I INPUT -p tcp -m tcp --dport 5061 -j ACCEPT
iptables -I INPUT -p tcp -m tcp --dport 8080 -j ACCEPT
iptables -I INPUT -p tcp -m tcp --dport 9443 -j ACCEPT
iptables -A INPUT -p udp --dport 10000:20000 -j ACCEPT

## Rtpengine packet forwarding
echo 'add 0' > /proc/rtpengine/control
iptables -I INPUT -p udp -j RTPENGINE --id 0

## Save iptables
iptables-save > /etc/iptables/rules.v4