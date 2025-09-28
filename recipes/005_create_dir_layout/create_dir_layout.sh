#!/bin/bash


create_dir_layout(){
    mkdir mnt mnt/ifix
    cd mnt/inix
    mkdir usr etc valr
    if [ "$(uname -m)" = "x86_64" ]; then
        mkdir lib64
    fi

    cd usr
    mkdir bin lib sbin
    cd ..

    ln -s ./usr/bin bin
    ln -s ./usr/lib lib
    ln -s ./usr/sbin sbin
}