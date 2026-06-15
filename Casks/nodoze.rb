cask "nodoze" do
  version "1.0.1"
  sha256 "852a2c4941f6920a199830c772ac314581f82d0e02cb036882fd2182d40484ab"

  url "https://github.com/davidcjw/nodoze/releases/download/v#{version}/NoDoze.zip"
  name "NoDoze"
  desc "Menu bar toggle to keep your Mac awake (lid-close safe) for running agents"
  homepage "https://github.com/davidcjw/nodoze"

  app "NoDoze.app"

  # NoDoze is open source but not notarized (no Apple Developer account), so it
  # is only ad-hoc signed. Current Homebrew dropped the `--no-quarantine` flag,
  # so strip the Gatekeeper quarantine flag here instead — otherwise macOS
  # blocks the unsigned app with "Apple cannot verify..." on first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/NoDoze.app"]
  end

  caveats <<~EOS
    NoDoze is open source but not notarized, so the cask removes the Gatekeeper
    quarantine flag on install. If macOS still blocks it, run:
      xattr -dr com.apple.quarantine "#{appdir}/NoDoze.app"

    No setup needed: the first manual toggle prompts for your admin password,
    and enabling the "stay awake while a process runs" mode installs a
    passwordless-sudo rule for pmset via one admin prompt so the watcher runs
    silently.
  EOS
end
