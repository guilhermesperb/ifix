#!/bin/bash

alocate_space(){
    local disc="/dev/sdb"

    sudo sgdisk -n 1:1M:+2M -t 1:ef02 "$disc"

    sudo sgdisk -p "$disc"
}