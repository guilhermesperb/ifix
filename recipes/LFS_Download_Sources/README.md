# Script de Download e Verificação de Fontes - Linux From Scratch (LFS)

Esse script bash automatiza a preparação do ambiente para o LFS versão 11.3. Ele realiza a verificação das dependências necessárias, faz o download da lista de pacotes e dos arquivos `md5sums`, baixa os pacotes e verifica a integridade dos arquivos utilizando `md5sum`

## Requisitos

- Acesso à internet
- permissões para instalar pacotes via `apt`

## Dependências

- `wget`
- `curl`
- `md5sum` (parte do pacote core utils)

Caso tenha alguma dependência ausente, o script informará como isntalá-la, e encerrará sua execução.

## Funcionalidades

- Verificação automática de dependências do sistema
- Criação do diretório de destino dos pacotes (`~/lfs-sources`)
- Baixa todos os pacotes listados
- Verifica a integridade dos arquivos via `md5sum`
- Geração dos arquivos `veriicacao.log`e `falhas.log` em caso de erros

## Como usar

1. Dê permissão de execução ao script:

```bash
	chmod +x Lfs_download_sources.hs
```
