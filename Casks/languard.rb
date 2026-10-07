cask "languard" do
  version "1.1.0"
  sha256 "c7ddeac865fbe47bd381b034ba81023999b93f104e9b60593b590694e65163e0"

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
