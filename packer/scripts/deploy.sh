#!/bin/bash -e
apt update && \
apt install -y git
cd /home/ubuntu &&  \
git clone -b monolith --depth=1  https://github.com/express42/reddit.git && \
cd reddit && bundle install
