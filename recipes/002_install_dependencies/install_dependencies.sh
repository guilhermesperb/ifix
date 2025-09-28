#!/bin/bash
# Um script para listar os números de versão de ferramentas críticas de desenvolvimento
# Se você tiver ferramentas instaladas em outros diretórios, ajuste PATH
# aqui E em ~lfs/.bashrc (seção 4.4) também.
install_dependencies(){
  apt install -y \
    binutils \
    bison \
    gawk \
    gcc \
    g++ \
    m4 \
    make \
    texinfo \
}
