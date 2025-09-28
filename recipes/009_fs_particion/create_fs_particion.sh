

create_fs_particion(){
    mkfs -v -t ext4 /dev/ifix

    mkswap /dev/swap
}