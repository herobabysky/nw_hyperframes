#!/bin/bash
# Cloud sessions start from a fresh container: make sure HyperFrames can render
# and Claude SEO's Python runtime exists.
set -euo pipefail
[ "${CLAUDE_CODE_REMOTE:-}" = "true" ] || exit 0
cd "${CLAUDE_PROJECT_DIR:-$(dirname "$0")/..}"
npx -y hyperframes@0.8.155 browser ensure >/dev/null 2>&1 || echo "hyperframes: browser ensure failed" >&2
# The SEO runtime install takes a few minutes; run it in the background.
if ! tools/claude-seo/scripts/claude-seo doctor >/dev/null 2>&1; then
  nohup tools/claude-seo/scripts/claude-seo setup >/tmp/claude-seo-setup.log 2>&1 &
fi
