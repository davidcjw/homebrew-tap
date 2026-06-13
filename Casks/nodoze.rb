cask "nodoze" do
  version "1.0"
  sha256 "e3c50207d15638106f2e68940d300fc50a9f9e28ff911e528c67d1e8739a6286"

  url "https://github.com/davidcjw/nodoze/releases/download/v#{version}/NoDoze.zip"
  name "NoDoze"
  desc "Menu bar toggle to keep your Mac awake (lid-close safe) for running agents"
  homepage "https://github.com/davidcjw/nodoze"

  app "NoDoze.app"

  caveats <<~EOS
    NoDoze is not notarized (open source, no Apple Developer account), so install
    with the --no-quarantine flag to skip Gatekeeper:

      brew install --cask --no-quarantine davidcjw/tap/nodoze

    A manual toggle prompts for your admin password. For password-free toggling
    and the "stay awake while a process runs" mode, run once:

      "#{appdir}/NoDoze.app/Contents/Resources/install-sudoers.sh"
  EOS
end
