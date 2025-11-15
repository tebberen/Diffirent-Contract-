#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$ROOT_DIR"

if [[ ! -f .env ]]; then
  echo "[deploy] .env dosyası bulunamadı. Lütfen .env oluşturup ortam değişkenlerini doldurun." >&2
  exit 1
fi

# shellcheck disable=SC2046
set -a
source .env
set +a

: "${PRIVATE_KEY:?PRIVATE_KEY tanımlanmalı}"
: "${RPC_URL:?RPC_URL tanımlanmalı}"

cmd=(forge script scripts/DeployMainHub.s.sol:DeployMainHub \
  --rpc-url "$RPC_URL" \
  --broadcast \
  --slow)

if [[ -n "${EXPLORER_API_KEY:-}" ]]; then
  cmd+=(--verify --etherscan-api-key "$EXPLORER_API_KEY")
fi

printf '[deploy] Komut: %s\n' "${cmd[*]}"
"${cmd[@]}"
