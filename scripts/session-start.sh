#!/bin/bash
# Cloud sessions start from a fresh container: make sure HyperFrames can render.
set -euo pipefail
[ "${CLAUDE_CODE_REMOTE:-}" = "true" ] || exit 0
npx -y hyperframes@0.8.155 browser ensure >/dev/null 2>&1 || echo "hyperframes: browser ensure failed" >&2
