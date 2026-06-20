#!/bin/bash
# scripts/deploy.sh — projeto-gridstart
#
# Le as variaveis de ambiente do .env (script roda a partir da raiz do
# projeto) e notifica o time via Slack a cada implantacao.
#
# Referenciado por:
#   - README.md ("Como usar": ./scripts/deploy.sh)
#   - S04T04V03 (.env / .env.example -> SLACK_WEBHOOK_URL)
#   - S05T01V03 flow_timer.sh (cronometra como caixa-preta)
#   - S05T01V05 feedback_amplifier.sh (le o exit code em DEPLOY_STATUS)

set -euo pipefail

# Carrega variaveis do .env, se existir
if [ -f .env ]; then
  set -a
  source .env
  set +a
fi

echo "=== Deploy iniciado em $(date '+%Y-%m-%d %H:%M:%S') ==="
echo "Versao do projeto: 1.0"

# Passo de deploy real (substituir pela chamada de verdade:
# build, push de imagem, kubectl apply, terraform apply, etc.)
echo "Aplicando mudancas em producao..."
sleep 1

# Notificacao via Slack (variavel vinda do .env, usada pelo deploy.sh)
if [ -n "${SLACK_WEBHOOK_URL:-}" ]; then
  curl -s -X POST -H 'Content-type: application/json' \
    --data '{"text":"Deploy do projeto-gridstart concluido com sucesso."}' \
    "$SLACK_WEBHOOK_URL" > /dev/null || true
else
  echo "Aviso: SLACK_WEBHOOK_URL nao definida — notificacao nao enviada."
fi

echo "=== Deploy concluido com sucesso ==="
exit 0
