cask "ntfybar" do
  version "1.1.0"
  sha256 "1e4dac17ec5a27e043a3acb9a1ef6b941720f7a954620e88e8ad45be686281ae"

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
