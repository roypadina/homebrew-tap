cask "ntfybar" do
  version "1.7.1"
  sha256 "d9dbbe1c306e910abf00eb04194c82cd7e512daec1ed1efa9693756ad038c8ce"

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
