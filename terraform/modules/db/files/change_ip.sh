#!/bin/bash -e

sudo sed -i "s/^\( *bindIp *: *\).*/\1${ip}/" /etc/mongod.conf
sudo systemctl restart mongod
