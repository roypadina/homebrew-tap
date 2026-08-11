cask "claude-monitor" do
  version "1.0.0"
  sha256 "93ed6418cce4a0737ffcb23a584d2a446c34f60149710c61b8c4bcb88ff19300"

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
