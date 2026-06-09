cask "agentclimenu" do
  version "0.3.0"
  sha256 "8625acea084f6e4b8dd4615054b2600c3e0933a777e11d238a2845ac8a414ea9"

  url "https://github.com/roypadina/AgentCliMenu/releases/download/v#{version}/AgentCliMenu.zip"
  name "Agent CLI Menu"
  desc "Menu + GUI to start or resume Claude/Codex coding-agent sessions"
  homepage "https://github.com/roypadina/AgentCliMenu"

  depends_on formula: "node"
  depends_on macos: :monterey

  app "Agent CLI Menu.app"
  binary "#{appdir}/Agent CLI Menu.app/Contents/Resources/cli/bin/agent-cli-menu"
  binary "#{appdir}/Agent CLI Menu.app/Contents/Resources/cli/bin/acm"

  zap trash: "~/.config/agentclimenu"

  caveats <<~EOS
    Agent CLI Menu is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Right-click Agent CLI Menu in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine "/Applications/Agent CLI Menu.app"

    The agent-cli-menu (and acm) commands run on Node (installed as a dependency).
  EOS
end
