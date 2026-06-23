cask "maccy-actions" do
  version "2.6.2"
  sha256 "31248bfafa6ea6e9ff2a4ee239b2950026e106c400a71277869d63081d7c2026"

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
