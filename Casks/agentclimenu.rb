cask "agentclimenu" do
  version "0.2.0"
  sha256 "9258745eed5a571f23a4faae3e9a7687fa57690b469e5a81f1fe4336c5f8972c"

  url "https://github.com/roypadina/AgentCliMenu/releases/download/v#{version}/AgentCliMenu.zip"
  name "Agent CLI Menu"
  desc "Menu + GUI to start or resume Claude/Codex coding-agent sessions"
  homepage "https://github.com/roypadina/AgentCliMenu"

  depends_on formula: "node"
  depends_on macos: :monterey

  app "AgentCliMenu.app"
  binary "#{appdir}/AgentCliMenu.app/Contents/Resources/cli/bin/agent-cli-menu"
  binary "#{appdir}/AgentCliMenu.app/Contents/Resources/cli/bin/acm"

  zap trash: "~/.config/agentclimenu"

  caveats <<~EOS
    Agent CLI Menu is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Right-click Agent CLI Menu in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine "/Applications/AgentCliMenu.app"

    The agent-cli-menu (and acm) commands run on Node (installed as a dependency).
  EOS
end
