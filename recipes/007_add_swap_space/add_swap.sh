#!/bin/bash


add_swap(){
    # Exemplo: arquivo swap de 1G
    local caminho_swap="/swapfile"
    local total_memory=$(cat /proc/meminfo | grep MemTotal | cut -d ' ' -f 8)

    dd if=/dev/zero of="$caminho_swap" bs=1K count=$total_memory

    chmod 600 "$caminho_swap"
    mkswap "$caminho_swap"
    swapon "$caminho_swap"
    $caminho_swap none swap sw 0 0
}