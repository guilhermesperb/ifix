# Criação do layout de diretórios base
### o que faz
Cria as pastas base onde estarão os arquivos montados prontos para uso, segue abaixo o formato que deve ser gerado:

```plaintext
/
mnt/
+ ifix/
| + usr/
| | + bin/
| | + lib/
| | + sbin/
| + etc/
| + var/
| + [lib64/]
| + bin  -> ./usr/bin
| + lib  -> ./usr/lib
| + sbin -> ./usr/sbin
```

`legenda`:
* mnt: Sigla para mount, aqui estarão todos os dados do projeto
* []: Talvez crie ou não, dependendo das condições abaixo:
	* [`lib64/`]: será gerado apenas se o comando `uname -m` retornar x86_64, ou seja sistema 64 bits e arquitetura AMD64 compativel com x86
* ->: indica um link, onde a esquerda é o nome do link e a direita é o caminho referenciado
