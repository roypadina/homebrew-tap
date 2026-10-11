cask "languard" do
  version "1.1.4"
  sha256 "4a55815b3b0846c790bddde5bd2f876f27ae21a9f0a82560f675762b27575486"

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
