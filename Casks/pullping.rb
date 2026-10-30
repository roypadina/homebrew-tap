cask "pullping" do
  version "0.3.0"
  sha256 "be270302b3f123de856ffe63d84262c0c94e232756733d20fbfaf034553de6c6"

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
