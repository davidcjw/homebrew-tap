# davidcjw/homebrew-tap

Homebrew tap for my macOS apps and tools.

## Install

```bash
brew install --cask --no-quarantine davidcjw/tap/nodoze
```

`--no-quarantine` is required because the apps here are open source but not
notarized (no Apple Developer account). It strips the Gatekeeper quarantine flag
at install time so the app opens normally.

## Casks

| Cask | Description |
|------|-------------|
| [`nodoze`](Casks/nodoze.rb) | Minimalist menu bar toggle to keep your Mac awake (lid-close safe) for running AI agents. — [source](https://github.com/davidcjw/nodoze) |
