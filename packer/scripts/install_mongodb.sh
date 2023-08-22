#!/bin/bash -e
wget -qO - https://pgp.mongodb.com/server-4.2.asc | apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list
apt update && \
apt install -y mongodb-org
systemctl enable --now mongod
