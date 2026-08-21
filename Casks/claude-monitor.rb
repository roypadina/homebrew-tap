cask "claude-monitor" do
  version "1.2.1"
  sha256 "8db5f0808b53182bd60e6f80ae6d24ea91be5ae87b712c25ccbefa060ed12e76"

  url "https://github.com/roypadina/ClaudeMonitor/releases/download/v#{version}/ClaudeMonitor.zip",
      verified: "github.com/roypadina/ClaudeMonitor/"
  name "Claude Monitor"
  desc "Menu-bar monitor for Claude Code usage limits across multiple accounts"
  homepage "https://github.com/roypadina/ClaudeMonitor"

  depends_on macos: :sonoma

  app "ClaudeMonitor.app"

  caveats <<~EOS
    Claude Monitor is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Right-click ClaudeMonitor in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine "/Applications/ClaudeMonitor.app"
  EOS

  zap trash: [
    "~/Library/Preferences/com.roy.claudemonitor.plist",
  ]
end
