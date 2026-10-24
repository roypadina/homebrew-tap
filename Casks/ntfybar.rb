cask "ntfybar" do
  version "1.3.1"
  sha256 "8e736945e5e9eed6654aa18471e0878aded4aa58e9cfb286529ba4b67dcd93ff"

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
