cask "pullping" do
  version "0.5.0"
  sha256 "b354d1d2c0a77160d363e32b4f45b320d76da8bd4eb76e1b049b3dd9307af055"

  url "https://github.com/roypadina/PullPing/releases/download/v#{version}/PullPing.zip"
  name "PullPing"
  desc "Menu-bar notifier for GitHub pull requests and issues, with agent automations"
  homepage "https://github.com/roypadina/PullPing"

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
