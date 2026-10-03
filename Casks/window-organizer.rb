cask "window-organizer" do
  version "0.1.0"
  sha256 "e99e7d30d22cce12d61afe4cefeff8f240fc9a2e6d08cb7ae22c85aa348931ab"

  url "https://github.com/roypadina/window-organizer/releases/download/v#{version}/Window-Organizer.zip"
  name "Window Organizer"
  desc "Menu bar app to minimize, close, quit or force quit all apps with shortcuts"
  homepage "https://github.com/roypadina/window-organizer"

  depends_on macos: ">= :sonoma"

  app "Window Organizer.app"

  zap trash: "~/Library/Preferences/com.padina.window-organizer.plist"

  caveats <<~EOS
    Window Organizer is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Right-click Window Organizer in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine "/Applications/Window Organizer.app"

    Minimize and close need Accessibility permission. Re-check it after every update
    (toggle it off and on in System Settings, or run
    `tccutil reset Accessibility com.padina.window-organizer`).
  EOS
end
