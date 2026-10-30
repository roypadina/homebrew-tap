cask "agents-monitor" do
  version "1.7.2"
  sha256 "4e9b6462a2d5213fdfd8655334b8406b937d4f30a2352d4de80d9c8713e39d3f"

  url "https://github.com/roypadina/AgentsMonitor/releases/download/v#{version}/AgentsMonitor.zip"
  name "Agents Monitor"
  desc "Menu-bar monitor for Claude Code and Codex usage limits across multiple accounts"
  homepage "https://github.com/roypadina/AgentsMonitor"

  depends_on macos: :sonoma

  app "AgentsMonitor.app"

  zap trash: [
    "~/Library/Application Support/AgentsMonitor",
    "~/Library/Preferences/com.roy.agentsmonitor.plist",
    "~/Library/Preferences/com.roy.claudemonitor.plist",
  ]

  caveats <<~EOS
    Agents Monitor is ad-hoc signed (not notarized), so on first launch macOS may block it.
    On macOS 15+ open it once, then click "Open Anyway" in System Settings > Privacy & Security, or run once:
      xattr -dr com.apple.quarantine "/Applications/AgentsMonitor.app"

    Renamed from claude-monitor. If you had that cask installed, remove the old app and
    its stale login item:
      brew uninstall --cask claude-monitor
      rm -rf /Applications/ClaudeMonitor.app
    Your accounts, settings and alert history migrate across automatically on first launch.
  EOS
end
