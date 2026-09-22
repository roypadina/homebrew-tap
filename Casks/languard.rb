cask "languard" do
  version "1.0.2"
  sha256 "cd0307b8bbdedffe398f4f0a34dcb2102342ab1fc6f0c4382693ec780d5b64f9"

  url "https://github.com/roypadina/LanGuard/releases/download/v#{version}/LanGuard.zip"
  name "LanGuard"
  desc "Menu-bar app that turns Wi-Fi off on wired LAN and back on when unplugged"
  homepage "https://github.com/roypadina/LanGuard"

  depends_on macos: :sonoma

  app "LanGuard.app"

  caveats <<~EOS
    LanGuard is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Right-click LanGuard in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine "/Applications/LanGuard.app"
  EOS

  zap trash: [
    "~/Library/Preferences/com.roy.languard.plist",
  ]
end
