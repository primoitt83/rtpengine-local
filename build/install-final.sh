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
    module-assistant \
    /*.deb

apt-get clean; rm -rf /var/lib/apt/* /tmp/* /var/tmp/* /usr/share/doc/*