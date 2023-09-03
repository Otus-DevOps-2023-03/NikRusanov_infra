#!/bin/bash -xe
APP_DIR=${1:-$HOME}
sleep 20
cd $APP_DIR/reddit
bundle install
sudo mv /tmp/reddit.service /etc/systemd/system/reddit.service
sudo systemctl daemon-reload
sudo systemctl enable --now reddit.service
sudo systemctl restart reddit.service

