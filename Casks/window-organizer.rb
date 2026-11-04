cask "window-organizer" do
  version "0.4.1"
  sha256 "73d428e3d8cfc6dd6bbb585a535653fb90313fca0ea0c1435761cbe096f847d8"

  url "https://github.com/roypadina/window-organizer/releases/download/v#{version}/Window-Organizer.zip"
  name "Window Organizer"
  desc "Menu bar app to minimize, close, quit or force quit all apps with shortcuts"
  homepage "https://github.com/roypadina/window-organizer"

  auto_updates true
  depends_on macos: :sonoma

  app "Window Organizer.app"

  zap trash: "~/Library/Preferences/com.padina.window-organizer.plist"

  caveats <<~EOS
    Window Organizer is self-signed (not notarized), so on first launch macOS may block it.
    Open System Settings > Privacy & Security and click Open Anyway (right-click > Open no longer works on macOS 15+), or run once:
      xattr -dr com.apple.quarantine "/Applications/Window Organizer.app"

    Minimize and close need Accessibility permission. Since 0.2.0 the grant survives
    updates. Upgrading from 0.1.0, run once and grant again:
      tccutil reset Accessibility com.padina.window-organizer
  EOS
end
