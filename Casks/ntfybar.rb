cask "ntfybar" do
  version "1.5.0"
  sha256 "9bba597c1d70425d6d2e93226ba9b0fff3956e3373c3739488c99b0e999d384a"

  url "https://github.com/roypadina/NtfyBar/releases/download/v#{version}/NtfyBar.zip"
  name "NtfyBar"
  desc "Menu bar client for ntfy with popups, rules, commands and sandboxed plugins"
  homepage "https://github.com/roypadina/NtfyBar"

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
