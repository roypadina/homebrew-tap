cask "claude-monitor" do
  version "1.2.0"
  sha256 "07e8ab8f325a9743727a6d53e8b281fd2f2138c0a8e75bc22105f36f6821be05"

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
