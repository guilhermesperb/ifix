#!/bin/bash


check_deps(){
	echo "Verificando dependencias..."
	local MISSING_DEPS=false

	verificar_instalado(){
		if ! command -v $1 &> /dev/null; then
			echo "O comando '$1' não está instalado. Instale com: sudo apt install $2"
			MISSING_DEPS=true
		fi
	}
	verificar_instalado wget wget
	verificar_instalado curl curl
	verificar_instalado md5sum coreutils

	if $MISSING_DEPS; then
		echo "Alguma(s) dependências estão ausentes. Instale-as antes de continuar."
		exit 1
	fi
}
