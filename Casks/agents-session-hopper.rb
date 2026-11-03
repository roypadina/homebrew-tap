cask "agents-session-hopper" do
  version "1.3.0"
  sha256 "b980cd9f436c8854ceb78df2d66b1136e1fab0296cad23fae8542dfd43519a34"

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
