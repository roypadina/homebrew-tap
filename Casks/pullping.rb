cask "pullping" do
  version "0.1.0"
  sha256 "8460410a0137144c088b337cac7d1216eca3a65532485fd51484f594e951b520"

  url "https://github.com/roypadina/PullPing/releases/download/v#{version}/PullPing.zip"
  name "PullPing"
  desc "Menu-bar tracker and notifier for GitHub pull requests across accounts"
  homepage "https://github.com/roypadina/PullPing"

  depends_on macos: :sonoma

  app "PullPing.app"

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
