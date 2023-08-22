#!/bin/bash


yc compute instance create \
    --name packer-reddit   \
    --zone ru-central1-a   \
    --create-boot-disk name=disk1,size=10,image-name=reddit-full-1691021596  \
    --public-ip \
    --ssh-key ~/.ssh/appuser.pub

