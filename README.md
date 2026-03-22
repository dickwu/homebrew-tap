# Homebrew Tap

Homebrew formulae and casks for dickwu packages.

## Install

```bash
brew tap dickwu/tap
```

## Packages

| Package | Type | Description | Install |
|---------|------|-------------|---------|
| [`piu`](https://github.com/dickwu/piu) | Cask | Native desktop API client — Postman alternative built with Tauri | `brew install --cask piu` |
| [`ironguard`](https://github.com/dickwu/ironguard) | Formula | Modern cross-platform WireGuard in Rust — async Tokio, JSON config, QUIC transport, post-quantum ready | `brew install ironguard` |
| [`cron-rs-web`](https://github.com/dickwu/cron-rs-web) | Formula | Web dashboard for cron-rs — single binary with embedded Next.js UI | `brew install cron-rs-web` |

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
