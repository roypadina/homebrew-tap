cask "agents-monitor" do
  version "1.4.1"
  sha256 "f330842d48ddf0f9a93c694767eaa858eb958bbc4fd80d3154500605b3b01992"

  url "https://github.com/roypadina/AgentsMonitor/releases/download/v#{version}/AgentsMonitor.zip",
      verified: "github.com/roypadina/AgentsMonitor/"
  name "Agents Monitor"
  desc "Menu-bar monitor for Claude Code and Codex usage limits across multiple accounts"
  homepage "https://github.com/roypadina/AgentsMonitor"

  depends_on macos: :sonoma

  app "AgentsMonitor.app"

  zap trash: [
    "~/Library/Preferences/com.roy.agentsmonitor.plist",
    "~/Library/Preferences/com.roy.claudemonitor.plist",
  ]

  caveats <<~EOS
    Agents Monitor is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Right-click AgentsMonitor in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine "/Applications/AgentsMonitor.app"

    Renamed from claude-monitor. If you had that cask installed, remove the old app and
    its stale login item:
      brew uninstall --cask claude-monitor
      rm -rf /Applications/ClaudeMonitor.app
    Your accounts, settings and alert history migrate across automatically on first launch.
  EOS
end
