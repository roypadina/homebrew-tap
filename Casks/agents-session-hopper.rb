cask "agents-session-hopper" do
  version "1.4.1"
  sha256 "711810329fa97b5d4eae420d1e57defa53bcc68eca41f263faadc38a15394820"

  url "https://github.com/roypadina/AgentsSessionHopper/releases/download/v#{version}/AgentsSessionHopper.zip"
  name "AgentsSessionHopper"
  desc "Claude Code profiles: move a conversation to another of your accounts"
  homepage "https://github.com/roypadina/AgentsSessionHopper"

  depends_on macos: :sonoma

  app "AgentsSessionHopper.app"
  binary "#{appdir}/AgentsSessionHopper.app/Contents/Helpers/sessionhopper"

  zap trash: [
    "~/Library/Application Support/AgentsSessionHopper",
    "~/Library/Preferences/com.padina.agents-session-hopper.plist",
  ]

  caveats <<~EOS
    AgentsSessionHopper is self-signed (not notarized), so on first launch macOS may block it
    and the bundled `sessionhopper` command. Open System Settings > Privacy & Security and
    click Open Anyway, or run once:
      xattr -dr com.apple.quarantine "/Applications/AgentsSessionHopper.app"

    If you ran `sessionhopper install-hooks`, run `sessionhopper uninstall-hooks --profile <name>`
    before uninstalling.
  EOS
end
