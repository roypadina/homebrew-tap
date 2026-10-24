cask "smarthiddenbar" do
  version "1.3.2"
  sha256 "e72c617482a3f360d5067a4767f94be672a4228f89b25ceee1736714231a1f80"

  url "https://github.com/roypadina/SmartHiddenBar/releases/download/v#{version}/SmartHiddenBar.zip"
  name "SmartHiddenBar"
  desc "Menu-bar app that hides menu bar items and mirrors their menus"
  homepage "https://github.com/roypadina/SmartHiddenBar"

  depends_on macos: :golden_gate

  app "SmartHiddenBar.app"

  zap trash: [
    "~/Library/Caches/com.roypadina.SmartHiddenBar",
    "~/Library/Logs/SmartHiddenBar.log",
    "~/Library/Preferences/com.roypadina.SmartHiddenBar.plist",
  ]

  caveats <<~EOS
    SmartHiddenBar is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Right-click SmartHiddenBar in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine "/Applications/SmartHiddenBar.app"

    It must run from /Applications, and needs Accessibility permission. Re-grant
    Accessibility after every update (toggle it off and on in System Settings, or run
    `tccutil reset Accessibility com.roypadina.SmartHiddenBar`).
  EOS
end
