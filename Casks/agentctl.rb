cask "agentctl" do
  version "0.9.3"
  sha256 "2a5c4b5d31902f26f28536e90b3c642277d8ce2de0996a033fd16b104aa94f7e"

  url "https://github.com/roypadina/agentctl/releases/download/v#{version}/agentctl.zip"
  name "Agentctl"
  desc "Menu + GUI to start or resume Claude/Codex coding-agent sessions"
  homepage "https://github.com/roypadina/agentctl"

  depends_on formula: "node"
  depends_on macos: :monterey

  app "Agentctl.app"
  binary "#{appdir}/Agentctl.app/Contents/Resources/cli/bin/agentctl"

  zap trash: "~/.config/agentctl"

  caveats <<~EOS
    Agentctl is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Right-click Agentctl in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine "/Applications/Agentctl.app"

    The agentctl command runs on Node (installed as a dependency).
  EOS
end
