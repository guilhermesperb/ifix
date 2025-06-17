#!/bin/bash

. env_vars.sh
. env_functions.sh

printf "$STR_WELCOME\n\n"

verify_dependencies

criar_usuario_lfs