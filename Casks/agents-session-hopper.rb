cask "agents-session-hopper" do
  version "0.1.8"
  sha256 "e5c50bbcd23153368722421796b8baabc077b06d0d21099ab4ab92755f971a04"

  url "https://github.com/roypadina/AgentsSessionHopper/releases/download/v#{version}/AgentsSessionHopper.zip"
  name "AgentsSessionHopper"
  desc "Claude Code profiles: move a conversation to another of your accounts (beta)"
  homepage "https://github.com/roypadina/AgentsSessionHopper"

  depends_on macos: :sonoma

  app "AgentsSessionHopper.app"
  binary "#{appdir}/AgentsSessionHopper.app/Contents/Helpers/sessionhopper"

  zap trash: [
    "~/Library/Application Support/AgentsSessionHopper",
    "~/Library/Preferences/com.padina.agents-session-hopper.plist",
  ]

  caveats <<~EOS
    BETA: not fully tested; real account hand-offs are new. Please report issues.

    AgentsSessionHopper is self-signed (not notarized), so on first launch macOS may block it
    and the bundled `sessionhopper` command. Open System Settings > Privacy & Security and
    click Open Anyway, or run once:
      xattr -dr com.apple.quarantine "/Applications/AgentsSessionHopper.app"

    If you ran `sessionhopper install-hooks`, run `sessionhopper uninstall-hooks --profile <name>`
    before uninstalling.
  EOS
end
