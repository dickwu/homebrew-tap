# Homebrew Tap

Homebrew formulae and casks for dickwu packages.

## Install

```bash
brew tap dickwu/tap
```

## Packages

| Package | Type | Description | Install |
|---------|------|-------------|---------|
| [`r2`](https://github.com/dickwu/r2) | Cask | Desktop client for managing S3-compatible storage (Cloudflare R2, AWS S3, MinIO, RustFS) | `brew install --cask r2` |
| [`realtime-pdf`](https://github.com/dickwu/realtime-pdf) | Cask | Desktop PDF watcher with saved history and regeneration hooks | `brew install --cask realtime-pdf` |
| [`piu`](https://github.com/dickwu/piu) | Cask | Native desktop API client — Postman alternative built with Tauri | `brew install --cask piu` |
| [`wordbrain`](https://github.com/dickwu/wordbrain) | Cask | Local-first English vocabulary builder with word-network graphs and FSRS review | `brew install --cask wordbrain` |
| [`ironguard`](https://github.com/dickwu/ironguard) | Formula | Modern cross-platform WireGuard in Rust — async Tokio, JSON config, QUIC transport, post-quantum ready | `brew install ironguard` |
| [`cron-rs-web`](https://github.com/dickwu/cron-rs-web) | Formula | Web dashboard for cron-rs — single binary with embedded Next.js UI | `brew install cron-rs-web` |
| [`source-map-php`](https://github.com/dickwu/source-map-php) | Formula | CLI-first PHP code search indexer for Laravel and Hyperf repositories | `brew install source-map-php` |
| [`source-map-tauri`](https://github.com/dickwu/source-map-tauri) | Formula | Static Tauri app scanner that emits Meilisearch-ready NDJSON | `brew install source-map-tauri` |

## R2 Client

Desktop client for managing S3-compatible storage, including Cloudflare R2, AWS S3, MinIO, and RustFS.

```bash
brew install --cask r2
```

If macOS shows a damaged app or quarantine warning, run:

```bash
sudo xattr -d com.apple.quarantine /Applications/r2.app/
```

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

## source-map-tauri

```bash
brew install source-map-tauri
```

`source-map-tauri` statically scans Tauri repositories and emits Meilisearch-ready
NDJSON for artifacts, edges, warnings, and project metadata.

Use it to:

- extract frontend components, hooks, permissions, capabilities, and Rust command surfaces
- emit canonical frontend HTTP endpoint flows such as `LoginModal -> useLogin -> usePostApi -> POST /auth/login`
- validate scan bundles before upload or reindex

It reads Meilisearch credentials from:

1. `MEILI_HOST`, `MEILI_MASTER_KEY`, and `MEILI_SEARCH_KEY`
2. `~/.config/meilisearch/connect.json`

Common workflow:

```bash
source-map-tauri init --root /path/to/tauri-app
source-map-tauri scan --root /path/to/tauri-app --repo my-tauri-app --out /tmp/source-map-tauri
source-map-tauri validate --input /tmp/source-map-tauri
```


## Realtime PDF

Desktop PDF watcher with saved history, hook-driven regeneration commands, and a full-window PDF viewer.

```bash
brew install --cask realtime-pdf
```

If macOS shows a damaged app or quarantine warning, run:

```bash
sudo xattr -d com.apple.quarantine /Applications/Realtime\ PDF.app/
```

## WordBrain

Local-first English vocabulary builder. Read books and articles, mark words you already know, and grow a per-word knowledge graph backed by FSRS spaced-repetition review. Tauri 2 + Next.js 16 + React 19 + Tiptap 3 + Turso SQLite — everything stays on your machine, no cloud account, no telemetry.

```bash
brew install --cask wordbrain
```

If macOS shows a damaged app or quarantine warning, run:

```bash
sudo xattr -d com.apple.quarantine /Applications/WordBrain.app/
```
