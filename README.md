# rtpengine-local

## How to test

- create a Ubuntu 18.04 (bionic) VM;
- disable ipv6;
- install docker;
- install docker-compose.

Local ip: 192.168.5.

Create "net" network
````
docker network create --driver=bridge --subnet=172.25.0.0/16 net
````
Run this project:
````
cd /opt
git clone https://github.com/primoitt83/asterisk-local.git
````








