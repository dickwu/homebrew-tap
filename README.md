# Homebrew Tap

Homebrew formula for [cron-rs-web](https://github.com/dickwu/cron-rs-web).

Note: [cron-rs](https://github.com/dickwu/cron-rs) (the backend) is Linux-only (requires systemd) and is not available via Homebrew. Install it from [GitHub Releases](https://github.com/dickwu/cron-rs/releases).

## Install

```bash
brew tap dickwu/tap
brew install cron-rs-web
```

## Packages

| Formula | Description |
|---------|-------------|
| `cron-rs-web` | Web dashboard for cron-rs — single binary with embedded Next.js UI |

## Quick Start

```bash
# Start the web dashboard (connects to cron-rs API at localhost:9746)
cron-rs-web-server
# Open http://localhost:3000
```
