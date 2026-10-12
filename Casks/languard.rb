cask "languard" do
  version "1.1.6"
  sha256 "ddfc7c30a456e2d48726328096e01f00512b5fc906ec88806b4ae813276071ae"

  url "https://github.com/roypadina/LanGuard/releases/download/v#{version}/LanGuard.zip"
  name "LanGuard"
  desc "Menu-bar app that turns Wi-Fi off on wired LAN and back on when unplugged"
  homepage "https://github.com/roypadina/LanGuard"

  depends_on macos: :sonoma

  app "LanGuard.app"

  zap trash: "~/Library/Preferences/com.roy.languard.plist"

  caveats <<~EOS
    LanGuard is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Right-click LanGuard in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine "/Applications/LanGuard.app"
  EOS
end
