# trouble-se1-git-actions

Projeto para testar conectividade com o Container Registry da Magalu Cloud
(região `br-se1`) a partir de runners do GitHub Actions.

## Objetivo

Diagnosticar rota de rede e latência entre os runners `ubuntu-latest` do
GitHub Actions e o endpoint `container-registry.br-se1.magalu.cloud`, usando
`mtr` (My Traceroute) em modo relatório.

## Workflow

| Workflow | Arquivo | Trigger |
|----------|---------|---------|
| Network Diagnostics | `.github/workflows/network-diagnostics.yml` | `workflow_dispatch` (manual) |

### Como executar

1. Faça push do repositório para o GitHub.
2. Acesse a aba **Actions** do repositório.
3. Selecione o workflow **Network Diagnostics**.
4. Clique em **Run workflow**.

### O que o workflow faz

1. Instala o `mtr-tiny` no runner.
2. Executa `mtr` em modo relatório contra
   `container-registry.br-se1.magalu.cloud`:
   - `--report` — saída em relatório (não interativo)
   - `--report-wide` — não trunca nomes de host
   - `--report-cycles 10` — envia 10 ciclos de sondas por hop

O passo do `mtr` usa `continue-on-error: true`, então o job não falha caso
haja perda de pacotes ou hops sem resposta — o relatório é sempre coletado.
