#!/bin/bash
# Um script para listar os números de versão de ferramentas críticas de desenvolvimento
# Se você tiver ferramentas instaladas em outros diretórios, ajuste PATH
# aqui E em ~lfs/.bashrc (seção 4.4) também.
verify_dependencies(){
  LC_ALL=C
  PATH=/usr/bin:/bin

  mostrar_erro() {
    echo "FATAL: $1"
    exit 1
  }

  verificar_versao(){
    if ! type -p $2 &>/dev/null; then
      echo "$STR_ERROR: $STR_NOT_FOUND $2 ($1)"
      return 1
    fi

    v=$($2 --version 2>&1 | grep -E -o '[0-9]+\.[0-9\.]+[a-z]*' | head -n1)
    if printf '%s\n' $3 $v | sort --version-sort --check &>/dev/null; then
      printf "OK: %-9s %-6s >= $3\n" "$1" "$v"
      return 0
    else
      printf "$STR_ERROR: %-9s é MUITO ANTIGO ($3 ou mais recente exigido)\n" "$1"
      return 1
    fi
  }

  ver_kernel(){
    kver=$(uname -r | grep -E -o '^[0-9\.]+')
    if printf '%s\n' $1 $kver | sort --version-sort --check &>/dev/null; then
      printf "OK: Núcleo Linux $kver >= $1\n"
      return 0
    else
      printf "ERRO: Núcleo Linux ($kver) é MUITO ANTIGO ($1 ou mais recente exigido)\n" "$kver"
      return 1
    fi
  }

  alias_check() {
    if $1 --version 2>&1 | grep -qi $2; then
      printf "OK: %-4s is $2\n" "$1"
    else
      printf "$STR_ERROR: %-4s NÃO é $2\n" "$1"
    fi
  }

  grep --version > /dev/null 2> /dev/null || mostrar_erro "grep não funciona"
  sed '' /dev/null || mostrar_erro "sed não funciona"
  sort /dev/null || mostrar_erro "sort não funciona"

  # Coreutils primeiro, pois o sort precisa do Coreutils >= 7.0
  # Coreutils first because --version-sort needs Coreutils >= 7.0
  verificar_versao Coreutils sort 8.1 || bail "Coreutils too old, stop"
  verificar_versao Bash bash 3.2
  verificar_versao Binutils ld 2.13.1
  verificar_versao Bison bison 2.7
  verificar_versao Diffutils diff 2.8.1
  verificar_versao Findutils find 4.2.31
  verificar_versao Gawk gawk 4.0.1
  verificar_versao GCC gcc 5.4
  verificar_versao "GCC (C++)" g++ 5.4
  verificar_versao Grep grep 2.5.1a
  verificar_versao Gzip gzip 1.3.12
  verificar_versao M4 m4 1.4.10
  verificar_versao Make make 4.0
  verificar_versao Patch patch 2.5.4
  verificar_versao Perl perl 5.8.8
  verificar_versao Python python3 3.4
  verificar_versao Sed sed 4.1.5
  verificar_versao Tar tar 1.22
  verificar_versao Texinfo texi2any 5.0
  verificar_versao Xz xz 5.0.0
  verificar_karnel 5.4

  if mount | grep -q 'devpts on /dev/pts' && [ -e /dev/ptmx ]; then
    echo "OK: Núcleo Linux suporta UNIX 98 PTY"
  else
    echo "ERRO: Núcleo Linux NÃO suporta UNIX 98 PTY"
  fi

  echo "Aliases:"
  alias_check awk GNU
  alias_check yacc Bison
  alias_check sh Bash

  echo "Compiler check:"
  if printf "int main(){}" | g++ -x c++ -; then
    echo "OK: g++ funciona"
  else
    echo "ERRO: g++ NÃO funciona"
  fi
  rm -f a.out
}
