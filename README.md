# davidcjw/homebrew-tap

Homebrew tap for my macOS apps and tools.

## Install

```bash
brew tap davidcjw/tap
brew install --cask davidcjw/tap/nodoze
```

The apps here are open source but not notarized (no Apple Developer account),
so each cask strips the Gatekeeper quarantine flag on install — no extra flags
needed. If macOS ever still blocks an app, run:

```bash
xattr -dr com.apple.quarantine /Applications/NoDoze.app
```

## Casks

| Cask | Description |
|------|-------------|
| [`nodoze`](Casks/nodoze.rb) | Minimalist menu bar toggle to keep your Mac awake (lid-close safe) for running AI agents. — [source](https://github.com/davidcjw/nodoze) |
