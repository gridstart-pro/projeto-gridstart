# projeto-gridstart

![status](https://img.shields.io/badge/status-em%20desenvolvimento-00B4D8)
![license](https://img.shields.io/badge/licen%C3%A7a-MIT-blue)

> Projeto de exemplo construído ao longo do módulo **Second Gear** do
> GridStart Pro — usado para praticar versionamento, Conventional Commits,
> `.gitignore`, gestão de secrets, documentação e organização de
> repositório.

## Sobre o projeto

O `projeto-gridstart` simula uma aplicação que lê configurações sensíveis
(banco de dados, API de monitoramento, webhook do Slack e segredo de
assinatura JWT) a partir de variáveis de ambiente, e usa um script de
automação para notificar o time via Slack a cada implantação.

## Pré-requisitos

- Git instalado
- Bash (ou terminal compatível)
- Acesso a um banco de dados (para uso real — neste projeto de estudo,
  valores fictícios são suficientes)

## Instalação

1. Clone o repositório:

   ```bash
   git clone https://github.com/<seu-usuario>/projeto-gridstart.git
   cd projeto-gridstart
   ```

2. Copie o arquivo de exemplo de variáveis de ambiente:

   ```bash
   cp .env.example .env
   ```

3. Edite o `.env` com os valores reais do seu ambiente. Esse arquivo nunca
   é commitado (veja `.gitignore`).

## Como usar

Depois de configurar o `.env`, execute o script de deploy a partir da raiz
do projeto:

```bash
./scripts/deploy.sh
```

O script lê as variáveis do `.env` e envia uma notificação para o canal
configurado em `SLACK_WEBHOOK_URL`.

## Organização do repositório

```
projeto-gridstart/
├── .env.example     # variáveis de ambiente documentadas, sem valores sensíveis
├── .gitignore
├── README.md
├── configs/         # configurações da aplicação (em construção)
│   └── .gitkeep
├── docs/            # documentação adicional: ADRs, diagramas, decisões (em construção)
│   └── .gitkeep
└── scripts/         # scripts de automação (deploy, manutenção, etc.)
    └── deploy.sh
```

- **`scripts/`** — scripts de automação executados a partir da raiz do
  projeto, como o `deploy.sh`.
- **`docs/`** — documentação que não cabe no `README.md`: ADRs, diagramas
  de arquitetura, decisões de projeto. Por enquanto vazia — o `.gitkeep`
  garante que a pasta seja versionada mesmo sem conteúdo.
- **`configs/`** — arquivos de configuração da aplicação (ex.: perfis de
  ambiente, configs de observabilidade). Também vazia por enquanto.
- `.gitignore`, `.env.example` e `README.md` permanecem na raiz — é onde
  Git, GitHub e a maioria das ferramentas esperam encontrá-los.

## Como contribuir

1. Crie uma branch a partir de `main`:

   ```bash
   git checkout -b feat/minha-contribuicao
   ```

2. Siga o padrão de Conventional Commits (`feat:`, `fix:`, `docs:`,
   `chore:`...)
3. Abra um Pull Request descrevendo o que mudou e por quê

## Licença

Distribuído sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.
