cask "languard" do
  version "1.0.0"
  sha256 "4070b8ee6af3e499cbeefe2dba9f3b307e80b9fe2d6acd845768ff87118ddd8e"

  url "https://github.com/roypadina/LanGuard/releases/download/v#{version}/LanGuard.zip",
      verified: "github.com/roypadina/LanGuard/"
  name "LanGuard"
  desc "Menu-bar app that turns Wi-Fi off on wired LAN and back on when unplugged"
  homepage "https://github.com/roypadina/LanGuard"

  depends_on macos: ">= :sonoma"

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
