cask "smarthiddenbar" do
  version "1.7.2"
  sha256 "c1f5abeeb0f72c04487d6c53b875c27d12e99cf2c5424e6edc06a244ccfe1590"

  url "https://github.com/roypadina/SmartHiddenBar/releases/download/v#{version}/SmartHiddenBar.zip"
  name "SmartHiddenBar"
  desc "Menu-bar app that hides menu bar items and mirrors their menus"
  homepage "https://github.com/roypadina/SmartHiddenBar"

  auto_updates true
  depends_on macos: :golden_gate

  app "SmartHiddenBar.app"

  zap trash: [
    "~/Library/Caches/com.roypadina.SmartHiddenBar",
    "~/Library/Logs/SmartHiddenBar.log",
    "~/Library/Preferences/com.roypadina.SmartHiddenBar.plist",
  ]

  caveats <<~EOS
    SmartHiddenBar is self-signed (not notarized), so on first launch macOS may block it.
    Open System Settings > Privacy & Security and click Open Anyway (right-click > Open no longer works on macOS 15+), or run once:
      xattr -dr com.apple.quarantine "/Applications/SmartHiddenBar.app"

    It must run from /Applications, and needs Accessibility permission. Since 1.3.2 the
    grant survives updates. Upgrading from an older version, re-grant it once (toggle it
    off and on in System Settings, or run
    `tccutil reset Accessibility com.roypadina.SmartHiddenBar`).
  EOS
end
