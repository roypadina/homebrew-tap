cask "agents-monitor" do
  version "1.4.5"
  sha256 "5273eab7e163a94e17766b1aaf2843fc8a8ba2b43e9f983262ee4d17fe9b3b08"

  url "https://github.com/roypadina/AgentsMonitor/releases/download/v#{version}/AgentsMonitor.zip"
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
