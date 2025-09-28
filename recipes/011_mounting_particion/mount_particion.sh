#!/bin/bash

mount_particion(){
    mkdir -pv $LFS
    mount -v -t ext4 /dev/root $LFS
    mkdir -v $LFS/home
    mount -v -t ext4 /dev/home $LFS/home

    chown root:root $LFS
    chmod 755 $LFS
}