cask "claude-monitor" do
  version "1.1.0"
  sha256 "4431381aaebb39b50d065489aa8feb73538e3d25876c2c781cb52d9cb162cfc7"

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
