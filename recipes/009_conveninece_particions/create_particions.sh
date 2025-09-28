#!/bin/bash

create_particions(){
    sudo sgdisk -n 2:3M:+200M -t 1:8300 /dev/sda

    sudo mkfs.ext4 /dev/sda1
    sudo mkdir -p ./boot

    sudo mount /dev/sda1 /boot
    sudo mount /dev/sda1 /boot

    /dev/sda1: UUID="abcd-1234" TYPE="ext4"
    UUID=abcd-1234   /boot   ext4   defaults   0 2
}