cask "maccy-actions" do
  version "2.6.3"
  sha256 "2e36ae1d75b2a3fb4a40293e72f95ef48db54831d78d71f3adf74e2a3440707e"

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
