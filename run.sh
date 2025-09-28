#!/bin/bash

. env_vars.sh
. env_functions.sh

printf "$STR_WELCOME\n\n"

verify_dependencies
install_dependencies
criar_usuario_lfs
check_deps
create_dir_layout
download_sources
alocate_space
create_particions
create_fs_particion
add_mask
mount_particion