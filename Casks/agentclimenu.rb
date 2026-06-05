cask "agentclimenu" do
  version "0.1.0"
  sha256 "a5f899b465a0d09798ae7322fcd6c889d265fd074ef1949e9aafbba0ab91e103"

  url "https://github.com/roypadina/AgentCliMenu/releases/download/v#{version}/AgentCliMenu.zip"
  name "AgentCliMenu"
  desc "Menu + GUI to start or resume Claude/Codex coding-agent sessions"
  homepage "https://github.com/roypadina/AgentCliMenu"

  depends_on formula: "node"
  depends_on macos: :monterey

  app "AgentCliMenu.app"
  binary "#{appdir}/AgentCliMenu.app/Contents/Resources/cli/bin/cm"
  binary "#{appdir}/AgentCliMenu.app/Contents/Resources/cli/bin/cld"
  binary "#{appdir}/AgentCliMenu.app/Contents/Resources/cli/bin/ccsm"

  zap trash: "~/.config/agentclimenu"

  caveats <<~EOS
    AgentCliMenu is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Right-click AgentCliMenu in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine "/Applications/AgentCliMenu.app"

    The cm / cld / ccsm commands run on Node (installed as a dependency).
  EOS
end
