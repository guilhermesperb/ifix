#!/bin/bash

set -e

check_deps(){
	echo "Verificando dependencias..."
	local MISSING_DEPS=false

	if ! command -v wget &> /dev/null; then
		echo "O comando 'wget' não está instalado. Instale com: sudo apt install wget"
		MISSING_DEPS=true
	fi

	if ! command -v curl &> /dev/null; then
		echo "O comando 'curl' não está instalado. Isntale com: sudo apt install curl
		MISSING_DEPS=true
	fi

	if ! command -v md5sum &> /dev/null; then
		echo "O comando 'md5sum' não está instalado. Instale com: sudo apt install coreutils"
		MISSING_DEPS=true
	fi

	if $MISSING_DEPS; the
		echo "Alguma(s) dependências estão ausentes. Instale-as antes de continuar."
		exit 1
	fi
}
