cask "agents-monitor" do
  version "1.9.2"
  sha256 "621f7b668fde4f1702593373acf562383746b427747a5d383d10c6a1c60bb5a6"

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
