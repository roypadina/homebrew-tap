cask "pullping" do
  version "0.6.1"
  sha256 "5a82d6abf10c3d3d095da0c995dc26ee7291f4e8437ec2e950761468444f6667"

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
