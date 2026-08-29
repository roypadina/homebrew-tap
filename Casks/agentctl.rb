cask "agentctl" do
  version "0.7.0"
  sha256 "c842b03114dbded6107a509e0866e0f07779cea167452d1d7999146a80c2cfb9"

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
