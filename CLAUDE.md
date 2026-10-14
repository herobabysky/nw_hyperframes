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
