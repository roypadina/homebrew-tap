cask "maccy-actions" do
  version "2.6.1"
  sha256 "c30eb12b79a8dc5fdbf4c31f52aabd0f6fb1c050a7b76d0d44034810a03f300c"

  url "https://github.com/roypadina/maccy-actions/releases/download/v#{version}/MaccyActions.zip",
      verified: "github.com/roypadina/maccy-actions/"
  name "Maccy Actions"
  desc "Clipboard manager with rule-based actions and a headless config CLI"
  homepage "https://github.com/roypadina/maccy-actions"

  depends_on macos: :sonoma

  app "Maccy Actions.app"

  zap trash: "~/Library/Preferences/com.royp.MaccyActions.plist"

  caveats <<~EOS
    Maccy Actions is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Right-click "Maccy Actions" in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine "/Applications/Maccy Actions.app"
  EOS
end
