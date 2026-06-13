cask "nodoze" do
  version "1.0"
  sha256 "e3c50207d15638106f2e68940d300fc50a9f9e28ff911e528c67d1e8739a6286"

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

    A manual toggle prompts for your admin password. For password-free toggling
    and the "stay awake while a process runs" mode, run once:
      "#{appdir}/NoDoze.app/Contents/Resources/install-sudoers.sh"
  EOS
end
