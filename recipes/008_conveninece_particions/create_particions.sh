#!/bin/bash

#2.4.1.4
create_particions(){
    # Cria tabela GPT
    sudo parted $DISC --script mklabel gpt

    # /boot - 200MiB
    sudo parted $DISC --script mkpart primary 1MiB 201MiB
    sudo parted $DISC --script name 1 boot

    # swap - 2GiB
    sudo parted $DISC --script mkpart primary 201MiB 2257MiB
    sudo parted $DISC --script name 2 swap

    # root (/) - 20GiB
    sudo parted $DISC --script mkpart primary 2257MiB 2257MiB+20GiB
    sudo parted $DISC --script name 3 root

    # /home - 20GiB
    sudo parted $DISC --script mkpart primary 2257MiB+20GiB 2257MiB+40GiB
    sudo parted $DISC --script name 4 home

    # /opt - 10GiB
    sudo parted $DISC --script mkpart primary 2257MiB+40GiB 2257MiB+50GiB
    sudo parted $DISC --script name 5 opt

    # /tmp - 5GiB
    sudo parted $DISC --script mkpart primary 2257MiB+50GiB 2257MiB+55GiB
    sudo parted $DISC --script name 6 tmp

    # /usr/src - 10GiB
    sudo parted $DISC --script mkpart primary 2257MiB+55GiB 2257MiB+65GiB
    sudo parted $DISC --script name 7 usr_src

    # resto do disco para /usr (opcional, se quiser isolar /usr inteiro)
    sudo parted $DISC --script mkpart primary 2257MiB+65GiB 100%
    sudo parted $DISC --script name 8 usr

}