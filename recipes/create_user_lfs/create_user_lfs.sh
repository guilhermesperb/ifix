criar_usuario_lfs()
{
  if [ "$EUID" -ne 0 ]; then
    echo "Por favor, rode como usuário Root"
    exit 1
  fi

  if [ -z "$LFS" ]; then
    echo "Variável \$LFS não está definida. Defina ela com: 'export LFS=/mnt/lfs'"
    exit 1
  fi

  groupadd lfs
  useradd -s /bin/bash -g lfs -m -k /dev/null lfs

  echo "Cria uma senha para usuário 'lfs': "
  passwd lfs

  chown -v lfs $LFS/{usr{,/*},var,etc,tools}

  if [ "$(uname -m)" == "x86_64" ]; then
    chown -v lfs $LFS/lib64
  fi

  echo ""
  echo "Usuário 'lfs' criado e com permissões ajustadas"
  echo "Mude para este usuário com: 'su - lfs'"
  echo ""
}