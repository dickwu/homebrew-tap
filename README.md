# Homebrew Tap

Homebrew formulae and casks for dickwu packages.

## Install

```bash
brew tap dickwu/tap
```

## Packages

| Package | Type | Description | Install |
|---------|------|-------------|---------|
| [`realtime-pdf`](https://github.com/dickwu/realtime-pdf) | Cask | Desktop PDF watcher with saved history and regeneration hooks | `brew install --cask realtime-pdf` |
| [`piu`](https://github.com/dickwu/piu) | Cask | Native desktop API client — Postman alternative built with Tauri | `brew install --cask piu` |
| [`ironguard`](https://github.com/dickwu/ironguard) | Formula | Modern cross-platform WireGuard in Rust — async Tokio, JSON config, QUIC transport, post-quantum ready | `brew install ironguard` |
| [`cron-rs-web`](https://github.com/dickwu/cron-rs-web) | Formula | Web dashboard for cron-rs — single binary with embedded Next.js UI | `brew install cron-rs-web` |
| [`source-map-php`](https://github.com/dickwu/source-map-php) | Formula | CLI-first PHP code search indexer for Laravel and Hyperf repositories | `brew install source-map-php` |

## PIU

Native desktop API management app — a Postman alternative built with Tauri 2.0, React 19, and Ant Design 6. Offline-first with local SQLite storage, knowledge graph visualization, and LLM-friendly MCP server.

```bash
brew install --cask piu
```

The installer automatically removes the macOS quarantine flag. If you see a "damaged" warning, run:

```bash
sudo xattr -d com.apple.quarantine /Applications/Piu.app
```

## IronGuard

A from-scratch WireGuard implementation with QUIC transport and post-quantum cryptography.

```bash
brew install ironguard

# Generate keys
ironguard genkey > private.key
ironguard pubkey < private.key

# Run tunnel (requires sudo for TUN device)
sudo ironguard up utun9 --config wg.json --foreground
```

Features: Noise_IKpsk2 handshake, ChaCha20-Poly1305 AEAD, crypto-key routing, anti-replay, per-peer timers, MAC/cookie DoS mitigation, `.conf` import/export, optional QUIC transport (feature-gated), optional ML-KEM-768 post-quantum crypto (feature-gated).

## cron-rs-web

```bash
brew install cron-rs-web

# Start the web dashboard (connects to cron-rs API at localhost:9746)
cron-rs-web-server
# Open http://localhost:3000
```

Note: [cron-rs](https://github.com/dickwu/cron-rs) (the backend) is Linux-only (requires systemd) and is not available via Homebrew. Install it from [GitHub Releases](https://github.com/dickwu/cron-rs/releases).

## source-map-php

```bash
brew install source-map-php
```

This installs:

- `source-map-php`
- `phpantom_lsp`

`source-map-php` reads Meilisearch credentials from:

1. `MEILI_HOST` and `MEILI_MASTER_KEY`
2. `~/.config/meilisearch/connect.json`

Use it to index Laravel and Hyperf repos into Meilisearch, then search them by saved project name or full repo path.


## Realtime PDF

Desktop PDF watcher with saved history, hook-driven regeneration commands, and a full-window PDF viewer.

```bash
brew install --cask realtime-pdf
```

If macOS shows a damaged app or quarantine warning, run:

```bash
sudo xattr -d com.apple.quarantine /Applications/Realtime\ PDF.app/
```
