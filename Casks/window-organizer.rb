cask "window-organizer" do
  version "0.2.1"
  sha256 "f7597af80015fb1535565b65f1f731e967cb8ae99b9a536d9632f6850d482cfe"

  url "https://github.com/roypadina/window-organizer/releases/download/v#{version}/Window-Organizer.zip"
  name "Window Organizer"
  desc "Menu bar app to minimize, close, quit or force quit all apps with shortcuts"
  homepage "https://github.com/roypadina/window-organizer"

  depends_on macos: :sonoma

  app "Window Organizer.app"

  zap trash: "~/Library/Preferences/com.padina.window-organizer.plist"

  caveats <<~EOS
    Window Organizer is self-signed (not notarized), so on first launch macOS may block it.
    Right-click Window Organizer in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine "/Applications/Window Organizer.app"

    Minimize and close need Accessibility permission. Since 0.2.0 the grant survives
    updates. Upgrading from 0.1.0, run once and grant again:
      tccutil reset Accessibility com.padina.window-organizer
  EOS
end
