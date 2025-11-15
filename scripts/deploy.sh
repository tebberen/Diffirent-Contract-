#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$ROOT_DIR"

ENV_FILE=${ENV_FILE:-.env}
if [[ ! -f "$ENV_FILE" ]]; then
  echo "[deploy] $ENV_FILE dosyası bulunamadı. Lütfen ortam değişkenlerini doldurun." >&2
  exit 1
fi

set -a
source "$ENV_FILE"
set +a

: "${PRIVATE_KEY:?PRIVATE_KEY tanımlanmalı}"
: "${RPC_URL:?RPC_URL tanımlanmalı}"
NETWORK=${NETWORK:-alfajores}

case "$NETWORK" in
  alfajores)
    chain_args=(--chain-id 44787)
    ;;
  basesepolia)
    chain_args=(--chain-id 84532)
    ;;
  *)
    echo "[deploy] Desteklenmeyen NETWORK: $NETWORK (alfajores veya basesepolia kullanın)" >&2
    exit 1
    ;;
esac

cmd=(forge script scripts/DeployMainHub.s.sol:DeployMainHub \
  --rpc-url "$RPC_URL" \
  --broadcast \
  --slow \
  "${chain_args[@]}")

if [[ -n "${EXPLORER_API_KEY:-}" ]]; then
  export ETHERSCAN_API_KEY="$EXPLORER_API_KEY"
  cmd+=(--verify --etherscan-api-key "$EXPLORER_API_KEY")
fi

printf '[deploy] NETWORK=%s\n' "$NETWORK"
printf '[deploy] Komut: %s\n' "${cmd[*]}"
"${cmd[@]}"
