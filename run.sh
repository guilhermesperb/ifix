#!/bin/bash

. env_vars.sh
. env_functions.sh

printf "$STR_WELCOME\n\n"

verify_dependencies
create_dir_layout
criar_usuario_lfs
