cask "agentctl" do
  version "0.9.1"
  sha256 "b1c3ab738231b4a5d6f829613c170d731890d380f658507e206809bba8066327"

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
