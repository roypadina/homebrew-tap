cask "agents-monitor" do
  version "1.9.1"
  sha256 "c35960ceea755460c201ce6c4b0fafa8c28598be3a0045a94a0eddbebb8073f1"

  url "https://github.com/roypadina/AgentsMonitor/releases/download/v#{version}/AgentsMonitor.zip"
  name "Agents Monitor"
  desc "Menu-bar monitor for Claude Code, Codex and OpenRouter usage across accounts"
  homepage "https://github.com/roypadina/AgentsMonitor"

  auto_updates true
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

    From 1.9.0 the app updates itself (Settings > About > Check for Updates…).

    Renamed from claude-monitor. If you had that cask installed, remove the old app and
    its stale login item:
      brew uninstall --cask claude-monitor
      rm -rf /Applications/ClaudeMonitor.app
    Your accounts, settings and alert history migrate across automatically on first launch.
  EOS
end
