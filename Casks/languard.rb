cask "languard" do
  version "1.4.3"
  sha256 "804a6d92a1d4fa52d687f5d31f40ae22839108a379271578a8d6f2d6d660ac14"

  url "https://github.com/roypadina/LanGuard/releases/download/v#{version}/LanGuard.zip"
  name "LanGuard"
  desc "Menu-bar app that turns Wi-Fi off on wired LAN and back on when unplugged"
  homepage "https://github.com/roypadina/LanGuard"

  auto_updates true
  depends_on macos: :sonoma

  app "LanGuard.app"

  zap trash: "~/Library/Preferences/com.roy.languard.plist"

  caveats <<~EOS
    LanGuard is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Open System Settings > Privacy & Security and click Open Anyway (right-click > Open no longer works on macOS 15+), or run once:
      xattr -dr com.apple.quarantine "/Applications/LanGuard.app"
  EOS
end
