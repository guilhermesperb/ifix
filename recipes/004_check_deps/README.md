# Verificador de Dependências para Scripts bash

Este script tem como objetivo verificar se determinadas ferramentas essenciais estão instaladas no sistema antes da execução de um processo automatizado. Atualmente, ele checa a presença dos comandos: `wget`, `curl` e `md5sum`

## Requisitos

- Permissões para instalar pacotes via `apt`, caso algum esteja ausente

## Dependências
O script verifica os seguintes comandos:

- `wget`
- `curl`
- `md5sum` (parte do pacote `coreutils`)

Se algumas dessas ferramentas não estiver instalada, o script informará para instalá-la utilizando o `apt`.

## Como usar

1. Dê permissão de execução ao script

```bash
	chmod +x check_deps.sh
```
2. Execute o arquivo
```bash
	./check_deps.sh
```