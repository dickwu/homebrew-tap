# Homebrew Tap for cron-rs

Homebrew formulae for [cron-rs](https://github.com/dickwu/cron-rs) and [cron-rs-web](https://github.com/dickwu/cron-rs-web).

## Install

```bash
brew tap dickwu/tap
brew install cron-rs
brew install cron-rs-web
```

## Packages

| Formula | Description |
|---------|-------------|
| `cron-rs` | Systemd timer management platform — API server + CLI + task runner |
| `cron-rs-web` | Web dashboard — single binary with embedded Next.js UI |

## Quick Start

```bash
# Set up and start the backend
cron-rs init
cron-rs daemon &

# Start the web dashboard
cron-rs-web-server
# Open http://localhost:3000
```
