cask "languard" do
  version "1.2.1"
  sha256 "5897485b5fe430a904272dc746335faa0125ce026527e46ed3fec643094f8f06"

  url "https://github.com/roypadina/LanGuard/releases/download/v#{version}/LanGuard.zip"
  name "LanGuard"
  desc "Menu-bar app that turns Wi-Fi off on wired LAN and back on when unplugged"
  homepage "https://github.com/roypadina/LanGuard"

  depends_on macos: :sonoma

  app "LanGuard.app"

  zap trash: "~/Library/Preferences/com.roy.languard.plist"

  caveats <<~EOS
    LanGuard is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Open System Settings > Privacy & Security and click Open Anyway (right-click > Open no longer works on macOS 15+), or run once:
      xattr -dr com.apple.quarantine "/Applications/LanGuard.app"
  EOS
end
