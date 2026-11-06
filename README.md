# Life Farmer Homebrew tap

Homebrew tap for [Life Farmer](https://lifefarmer.ca) local-first tools.

Catalog: [lifefarmer.ca](https://lifefarmer.ca). Support: [lifefarmer.ca/support](https://lifefarmer.ca/support).

Source links below use a `lifefarmer/…` label. Homebrew still installs this tap with the command in the next section.

## Add the tap

```bash
brew tap dickwu/tap
```

Short names in the table work after the tap is added. `git-strata` and `git-strata-desktop` are listed with fully qualified names.

## Packages

| Package | Type | Description | Product | Source | Install |
|---------|------|-------------|---------|--------|---------|
| `ai-web-debugger` | Cask | Observable Electron browser for LLM-driven webpage debugging | [ai-web-debugger.lifefarmer.ca](https://ai-web-debugger.lifefarmer.ca) | [lifefarmer/ai-web-debugger](https://github.com/dickwu/ai-web-debugger) | `brew install --cask ai-web-debugger` |
| `git-strata-desktop` | Cask | Desktop app for git-strata sessions (macOS arm64; installs the git-strata formula) | [git-strata-desktop.lifefarmer.ca](https://git-strata-desktop.lifefarmer.ca) | [lifefarmer/git-strata](https://github.com/dickwu/git-strata) | `brew install --cask dickwu/tap/git-strata-desktop` |
| `piu` | Cask | Native desktop API client — Postman alternative built with Tauri | [piu.lifefarmer.ca](https://piu.lifefarmer.ca) | [lifefarmer/piu](https://github.com/dickwu/piu) | `brew install --cask piu` |
| `r2` | Cask | Desktop client for managing S3-compatible storage (Cloudflare R2, AWS S3, MinIO, RustFS) | [r2.lifefarmer.ca](https://r2.lifefarmer.ca) | [lifefarmer/r2](https://github.com/dickwu/r2) | `brew install --cask r2` |
| `realtime-pdf` | Cask | Desktop PDF watcher with saved history and regeneration hooks | [realtime-pdf.lifefarmer.ca](https://realtime-pdf.lifefarmer.ca) | [lifefarmer/realtime-pdf](https://github.com/dickwu/realtime-pdf) | `brew install --cask realtime-pdf` |
| `wordbrain` | Cask | Local-first English vocabulary builder with FSRS review and word-network graphs | [wordbrain.lifefarmer.ca](https://wordbrain.lifefarmer.ca) | [lifefarmer/wordbrain](https://github.com/dickwu/wordbrain) | `brew install --cask wordbrain` |
| `auto-push` | Formula | CLI tool that automates git workflow with AI-generated commit messages | [auto-push.lifefarmer.ca](https://auto-push.lifefarmer.ca) | [lifefarmer/auto-push](https://github.com/dickwu/auto-push) | `brew install auto-push` |
| `cron-rs-web` | Formula | Web dashboard for cron-rs — single binary with embedded Next.js UI | [cron-rs-web.lifefarmer.ca](https://cron-rs-web.lifefarmer.ca) | [lifefarmer/cron-rs-web](https://github.com/dickwu/cron-rs-web) | `brew install cron-rs-web` |
| `document-embed` | Formula | PHP extension for screenshot-robust PDF and image TrustMark IDs | [document-embed.lifefarmer.ca](https://document-embed.lifefarmer.ca) | [lifefarmer/document_embed](https://github.com/dickwu/document_embed) | `brew install document-embed` |
| `git-strata` | Formula | Per-session APFS workspaces over shared git base snapshots (macOS arm64) | [git-strata.lifefarmer.ca](https://git-strata.lifefarmer.ca) | [lifefarmer/git-strata](https://github.com/dickwu/git-strata) | `brew install dickwu/tap/git-strata` |
| `html-pdf` | Formula | PHP extension for Ironpress HTML and Markdown PDF rendering | [html-pdf.lifefarmer.ca](https://html-pdf.lifefarmer.ca) | [lifefarmer/html-pdf](https://github.com/dickwu/html-pdf) | `brew install html-pdf` |
| `ironguard` | Formula | Modern cross-platform WireGuard implementation in Rust | [ironguard.lifefarmer.ca](https://ironguard.lifefarmer.ca) | [lifefarmer/ironguard](https://github.com/dickwu/ironguard) | `brew install ironguard` |
| `source-map-php` | Formula | CLI-first PHP code search indexer for Laravel and Hyperf repositories | [source-map-php.lifefarmer.ca](https://source-map-php.lifefarmer.ca) | [lifefarmer/source-map-php](https://github.com/dickwu/source-map-php) | `brew install source-map-php` |
| `source-map-tauri` | Formula | Static Tauri app scanner that emits Meilisearch-ready NDJSON | [source-map-tauri.lifefarmer.ca](https://source-map-tauri.lifefarmer.ca) | [lifefarmer/source-map-tauri](https://github.com/dickwu/source-map-tauri) | `brew install source-map-tauri` |
| `sub-bot` | Formula | Self-hosted Rust agent server with sessions, async tasks and signed webhooks | [sub-bot.lifefarmer.ca](https://sub-bot.lifefarmer.ca) | [lifefarmer/sub-bot](https://github.com/dickwu/sub-bot) | `brew install sub-bot` |
| `tauri-connector` | Formula | CLI for deep inspection and interaction with Tauri v2 desktop apps | [tauri-connector.lifefarmer.ca](https://tauri-connector.lifefarmer.ca) | [lifefarmer/tauri-connector](https://github.com/dickwu/tauri-connector) | `brew install tauri-connector` |

## macOS quarantine

If macOS shows a damaged-app or quarantine warning for a cask, clear `com.apple.quarantine` on that app. For GIT STRATA, allow it under System Settings > Privacy & Security > Open Anyway when it is listed there.

```bash
sudo xattr -d com.apple.quarantine /Applications/AI\ Web\ Debugger.app/
sudo xattr -d com.apple.quarantine /Applications/r2.app/
sudo xattr -d com.apple.quarantine /Applications/Piu.app
sudo xattr -d com.apple.quarantine /Applications/Realtime\ PDF.app/
sudo xattr -d com.apple.quarantine /Applications/WordBrain.app/
sudo xattr -dr com.apple.quarantine "/Applications/GIT STRATA.app"
```

Formula binaries are installed by Homebrew and do not need `xattr`.

## Notes

### git-strata

`git-strata` and `git-stratad` provide per-session APFS workspaces. macOS arm64 (Apple silicon) only, macOS 13+, with repos and the data root on one APFS volume.

The daemon is the single LaunchAgent `com.gwd.git-stratad`. Do not use `brew services` for it. Write the plist once with the stable opt path, then start it:

```bash
mkdir -p ~/Library/LaunchAgents
t=$(mktemp ~/Library/LaunchAgents/.git-stratad.XXXXXX) &&
  git-stratad --print-plist "$(brew --prefix)/opt/git-strata/bin/git-stratad" > "$t" &&
  mv "$t" ~/Library/LaunchAgents/com.gwd.git-stratad.plist
mkdir -p ~/Library/Application\ Support/git-strata
cp "$(brew --prefix)/share/git-strata/config.toml" ~/Library/Application\ Support/git-strata/
# edit config.toml ([paths] root on the same APFS volume as your repos), then:
git-strata daemon start
```

After `brew upgrade git-strata`, run `git-strata daemon stop && git-strata daemon start`. Before uninstalling, run `git-strata daemon stop` and remove `~/Library/LaunchAgents/com.gwd.git-stratad.plist`.

### GIT STRATA Desktop

The desktop app drives that same daemon and depends on the `git-strata` formula. macOS arm64 only. Quarantine handling is in the section above.

New git-strata releases update both the formula and the cask through git-strata's `homebrew.yml` workflow.

### cron-rs-web

`cron-rs-web-server` serves the dashboard at <http://localhost:3000> and expects the cron-rs API at `localhost:9746`.

[lifefarmer/cron-rs](https://github.com/dickwu/cron-rs), the backend, is Linux-only (systemd) and is not in this tap. Install it from [GitHub Releases](https://github.com/dickwu/cron-rs/releases).

### source-map

`source-map-php` installs `source-map-php` and `phpantom_lsp`. It reads Meilisearch credentials from:

1. `MEILI_HOST` and `MEILI_MASTER_KEY`
2. `~/.config/meilisearch/connect.json`

`source-map-tauri` reads `MEILI_HOST`, `MEILI_MASTER_KEY`, and `MEILI_SEARCH_KEY`, then the same `connect.json`.

```bash
source-map-tauri init --root /path/to/tauri-app
source-map-tauri scan --root /path/to/tauri-app --repo my-tauri-app --out /tmp/source-map-tauri
source-map-tauri validate --input /tmp/source-map-tauri
```

### IronGuard

Key generation and bringing a tunnel up (`sudo` for the TUN device) are documented at [ironguard.lifefarmer.ca](https://ironguard.lifefarmer.ca).
