#!/bin/bash -e
yc compute instance create \
    --name reddit-app-auto \
    --hostname reddit-app-auto \
    --memory=4 \
    --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
    --network-interface subnet-name=default-ru-central1-b,nat-ip-version=ipv4 \
    --metadata serial-port-enable=1 \
    --metadata-from-file user-data=yc_compute_init.yaml
