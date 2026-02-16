#!/bin/bash
set -euo pipefail

CONFIG="$HOME/.claude.json"

if [ -f "$CONFIG" ] && jq -e '.mcpServers.jetbrains' "$CONFIG" > /dev/null 2>&1; then
  echo "claude: JetBrains MCP server already configured, skipping"
  exit 0
fi

mkdir -p "$HOME/.claude"

[ -f "$CONFIG" ] || echo '{}' > "$CONFIG"
jq '.mcpServers.jetbrains = {"type": "sse", "url": "http://localhost:64342/sse"}' "$CONFIG" > "$CONFIG.tmp" && mv "$CONFIG.tmp" "$CONFIG"

echo "claude: JetBrains MCP server configured"
