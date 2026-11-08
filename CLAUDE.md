# nw_hyperframes

Video studio built on [HyperFrames](https://github.com/heygen-com/hyperframes) (HTML → MP4).
Each video is its own project folder (e.g. `first-video/`), created with:

    npx -y hyperframes@0.8.155 init <name> --non-interactive --resolution portrait

Start any video work with the `/hyperframes` skill (skills live in `.claude/skills/`).

## Environment notes
- `cdn.jsdelivr.net` is blocked by the cloud network policy. Never load GSAP or other
  libraries from a CDN — vendor them into `<project>/assets/vendor/` via `npm pack`
  (see `first-video/assets/vendor/gsap.min.js`). After `init`, rewrite the CDN `<script>`.
- Render: `cd <project> && npx -y hyperframes@0.8.155 render -o renders/out.mp4`
  (renders/ is gitignored).

## SEO (claude-seo v2.5.0)
[claude-seo](https://github.com/AgriciDaniel/claude-seo) is vendored at the v2.5.0 tag:
skills in `.claude/skills/seo*`, subagents in `.claude/agents/seo-*.md`, Python tooling in
`tools/claude-seo/` (plugin paths rewritten to these repo-relative locations — run from repo root).
Start with the `/seo` skill. Runtime: `tools/claude-seo/scripts/claude-seo setup|doctor|run <script>`
(the venv lives in `~/.local/share/claude-seo`; the SessionStart hook rebuilds it in the background).

Cloud-session limits: the scripts' SSRF guard refuses the loopback HTTPS proxy and needs local
DNS, so URL-fetching scripts fail here — do not patch `url_safety.py`. Use WebFetch to pull
pages and feed HTML to the scripts as files, or run audits from a local Claude Code checkout.
Playwright Chromium is unavailable (cdn.playwright.dev blocked), so rendered-page features are off.
