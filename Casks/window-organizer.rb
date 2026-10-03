cask "window-organizer" do
  version "0.2.0"
  sha256 "8693d6917b97db4aeede02cf5a3ec4dade237110a2021797960490f92aa2cb82"

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
