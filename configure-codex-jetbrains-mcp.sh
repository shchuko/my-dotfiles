#!/bin/bash
set -euo pipefail

CONFIG="$HOME/.codex/config.toml"

if [ -f "$CONFIG" ] && grep -q '\[mcp_servers\.intellij\]' "$CONFIG"; then
  echo "codex: JetBrains MCP server already configured, skipping"
  exit 0
fi

mkdir -p "$HOME/.codex"

cat >> "$CONFIG" << 'EOF'

[mcp_servers.intellij]
command = "/mnt/jetbrains/system/ide/jbr/bin/java"
args = ["-classpath", "/mnt/jetbrains/system/ide/plugins/mcpserver/lib/mcpserver-frontend.jar:/mnt/jetbrains/system/ide/lib/util-8.jar:/mnt/jetbrains/system/ide/lib/module-intellij.libraries.ktor.client.cio.jar:/mnt/jetbrains/system/ide/lib/module-intellij.libraries.ktor.client.jar:/mnt/jetbrains/system/ide/lib/module-intellij.libraries.ktor.network.tls.jar:/mnt/jetbrains/system/ide/lib/module-intellij.libraries.ktor.io.jar:/mnt/jetbrains/system/ide/lib/module-intellij.libraries.ktor.utils.jar:/mnt/jetbrains/system/ide/lib/module-intellij.libraries.kotlinx.io.jar:/mnt/jetbrains/system/ide/lib/module-intellij.libraries.kotlinx.serialization.core.jar:/mnt/jetbrains/system/ide/lib/module-intellij.libraries.kotlinx.serialization.json.jar", "com.intellij.mcpserver.stdio.McpStdioRunnerKt"]

[mcp_servers.intellij.env]
IJ_MCP_SERVER_PORT = "64342"
EOF

echo "codex: JetBrains MCP server configured"
