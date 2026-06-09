cask "languard" do
  version "1.0.1"
  sha256 "38d03e8bc49cd060cde46c1c0838192bb4281deb98ca3f95d9264472b636d531"

  url "https://github.com/roypadina/LanGuard/releases/download/v#{version}/LanGuard.zip",
      verified: "github.com/roypadina/LanGuard/"
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
