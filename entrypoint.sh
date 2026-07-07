#!/bin/sh
set -eu

echo "[fairytale] starting secure entrypoint"

SOURCE_WORKSPACE="/app/workspace"
TARGET_WORKSPACE="/root/.openclaw/workspace"
MEMORY_DIR="/root/.openclaw/memory"

required_file() {
  if [ ! -f "$SOURCE_WORKSPACE/$1" ]; then
    echo "[fairytale][FATAL] missing required workspace file: $1"
    exit 1
  fi
}

required_file "00_CONSTITUTION.md"
required_file "01_STRATEGY.md"
required_file "02_ARCHITECTURE.md"
required_file "05_LAWS.md"
required_file "06_ROLES.md"
required_file "07_AGENTS.md"
required_file "08_PROJECT_MEMORY.md"
required_file "09_DECISIONS.md"

mkdir -p "$TARGET_WORKSPACE"
mkdir -p "$MEMORY_DIR"
mkdir -p /root/.openclaw/logs

echo "[fairytale] syncing repo workspace to OpenClaw workspace"
rsync -a --delete "$SOURCE_WORKSPACE/" "$TARGET_WORKSPACE/"

echo "[fairytale] making workspace read-only"
chmod -R a-w "$TARGET_WORKSPACE" || true

echo "[fairytale] memory directory remains writable"
chmod -R u+rwX "$MEMORY_DIR" || true

echo "[fairytale] workspace files:"
find "$TARGET_WORKSPACE" -maxdepth 2 -type f | sort

echo "[fairytale] launching OpenClaw gateway"

echo "[fairytale] configuring Telegram owner access"

mkdir -p /root/.openclaw/credentials

if [ -z "${OWNER_TELEGRAM_ID:-}" ]; then
  echo "[fairytale][FATAL] OWNER_TELEGRAM_ID is not set"
  exit 1
fi

cat > /root/.openclaw/credentials/telegram-default-allowFrom.json <<EOF
{
  "version": 1,
  "allowFrom": [
    "${OWNER_TELEGRAM_ID}"
  ]
}
EOF

echo "[fairytale] Telegram owner allowed: ${OWNER_TELEGRAM_ID}"

exec openclaw gateway \
  --bind lan \
  --port 18789
