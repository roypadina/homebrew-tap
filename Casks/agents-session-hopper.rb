cask "agents-session-hopper" do
  version "1.0.0"
  sha256 "bf8be52a924dc0b4b82b38556713258c5547d645211568fea4d477f426cf6eba"

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
