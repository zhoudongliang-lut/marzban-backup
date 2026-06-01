#!/usr/bin/env bash
set -euo pipefail
RULES_FILE="${1:-/root/marzban-rules-pack/rules.list}"
RULES_YML="/var/lib/marzban/templates/clash/rules.yml"
META_YML="/var/lib/marzban/templates/clash/meta-rules.yml"

for f in "$RULES_YML" "$META_YML"; do
  [ -f "$f" ] || { echo "missing: $f"; exit 1; }
  cp -a "$f" "$f.bak.$(date +%F-%H%M%S)"
  tmp=$(mktemp)
  awk '{print} /^rules:/{exit}' "$f" > "$tmp"
  cat "$RULES_FILE" >> "$tmp"
  mv "$tmp" "$f"
  echo "updated: $f"
done

echo "done. refresh subscriptions in clients to take effect."
