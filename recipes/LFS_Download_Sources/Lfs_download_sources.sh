#!/bin/bash

set -e

download_sources(){
	local LFS_VERSION=11.3
	local LFS_MIRROR="https://www.linuxfromscratch.org/lfs/downloads/$LFS_VERSION"
	local DEST_DIR="$HOME/lfs-sources"

	mkdir -pv "$DEST_DIR"
	cd "$DEST_DIR"

	echo "Baixando lista de pacotes (wget-list e md5sums)"
	curl -O "$LFS_MIRROR/wget-list"

	if [[ ! -f wget-list ]]; then
		echo "Erro: wget-list não foi baixado corretamente."
		exit 1
	fi

	curl -O "$LFS_MIRROR/md5sums"

	if [[ ! -f md5sums ]]; then
		echo "Erro: md5sums não foi baixado corretamente."
		exit 1
	fi

	echo "Iniciando o download dos pacotes..."
	wget --input-file=wget-list --continue --directory-prefix=.

	echo "Verificando a integridade dos pacotes..."
	md5sum -c md5sums | tee verificacao.log

	if grep "FAILED" verificacao.log > falhas.log; then
		echo "Atenção: Alguns arquivos falharam na verificação de integridade. Confira falhas.log para mais detalhes."
		exit 1
	fi
	echo "Processo concluido!"
}
