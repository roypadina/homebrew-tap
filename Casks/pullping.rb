cask "pullping" do
  version "0.6.0"
  sha256 "4c7025667f467d3465f1743fb3b4ed40c9ee811dbec6081acbc9a6034f7f98ad"

  url "https://github.com/roypadina/PullPing/releases/download/v#{version}/PullPing.zip"
  name "PullPing"
  desc "Menu-bar notifier for GitHub pull requests and issues, with agent automations"
  homepage "https://github.com/roypadina/PullPing"

  auto_updates true
  depends_on macos: :sonoma

  app "PullPing.app"
  binary "#{appdir}/PullPing.app/Contents/MacOS/PullPing", target: "pullping"

  zap trash: [
    "~/Library/Application Support/PullPing",
    "~/Library/Preferences/com.padina.pullping.plist",
  ]

  caveats <<~EOS
    PullPing is self-signed with a stable identity (not notarized), so on first launch macOS may block it.
    Right-click PullPing in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine "/Applications/PullPing.app"

    Tokens are stored in your login keychain (items com.padina.pullping.*);
    remove them from Keychain Access when uninstalling.
  EOS
end
