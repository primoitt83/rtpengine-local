#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade -y

apt-get install -y -qqy \
    vim \
    wget \
    gnupg2 \
    iproute2 \
    git \
    curl \
    iptables \
    iptables-dev \
    dpkg-dev \
    debhelper \
    libcurl4-openssl-dev \
    libglib2.0-dev \
    libhiredis-dev \
    libpcre3-dev \
    libssl-dev \
    libxmlrpc-core-c3-dev \
    markdown \
    zlib1g-dev \
    module-assistant \
    dkms \
    gettext \
    default-libmysqlclient-dev \
    gperf \
    libavcodec-dev \
    libavfilter-dev \
    libavformat-dev \
    libavutil-dev \
    libbencode-perl \
    libcrypt-openssl-rsa-perl \
    libcrypt-rijndael-perl \
    libdigest-crc-perl \
    libdigest-hmac-perl \
    libevent-dev \
    libio-multiplex-perl \
    libio-socket-inet6-perl \
    libjson-glib-dev \
    libnet-interface-perl \
    libpcap0.8-dev \
    libsocket6-perl \
    libspandsp-dev \
    libswresample-dev \
    libsystemd-dev \
    nfs-common \
    netcat-openbsd \
    netcat \
    libconfig-tiny-perl \
    libjson-perl \
    libmosquitto-dev \
    libwebsockets-dev \
    python3-websockets \
    libopus-dev

wget https://deb.sipwise.com/spce/mr9.4.1/pool/main/b/bcg729/libbcg729-0_1.0.4+git20180222-0.1~bpo10+1_amd64.deb
wget https://deb.sipwise.com/spce/mr9.4.1/pool/main/b/bcg729/libbcg729-dev_1.0.4+git20180222-0.1~bpo10+1_amd64.deb

dpkg -i libbcg729-0_1.0.4+git20180222-0.1~bpo10+1_amd64.deb
dpkg -i libbcg729-dev_1.0.4+git20180222-0.1~bpo10+1_amd64.deb

apt-get install -y linux-headers-$(uname -r) linux-image-$(uname -r)
apt install -y -t bionic-backports init-system-helpers
apt install -y -t bionic-backports debhelper

git clone -b mr11.1.1 --single-branch https://github.com/sipwise/rtpengine.git /rtpengine
cd /rtpengine
git checkout mr11.1.1
dpkg-checkbuilddeps
dpkg-buildpackage -b -us -uc 
dpkg -i ../*.deb
dpkg -i ../*.ddeb