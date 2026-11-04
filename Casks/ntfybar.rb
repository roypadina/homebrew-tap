cask "ntfybar" do
  version "1.6.0"
  sha256 "d6184af6d7350ec81cc856df28b0de2476e809a16f5153897f1d1ea7f3aa72ae"

  url "https://github.com/roypadina/NtfyBar/releases/download/v#{version}/NtfyBar.zip"
  name "NtfyBar"
  desc "Menu bar client for ntfy with popups, rules, commands and sandboxed plugins"
  homepage "https://github.com/roypadina/NtfyBar"

  auto_updates true
  depends_on macos: :sonoma

  app "NtfyBar.app"

  zap trash: [
    "~/Library/Application Support/NtfyBar",
    "~/Library/Preferences/com.padina.ntfybar.plist",
  ]

  caveats <<~EOS
    NtfyBar is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Right-click NtfyBar in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine "/Applications/NtfyBar.app"
  EOS
end
