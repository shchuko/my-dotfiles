#!/bin/bash
set -euo pipefail

script_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

"$script_dir/configure-codex-jetbrains-mcp.sh"
"$script_dir/configure-claude-jetbrains-mcp.sh"
