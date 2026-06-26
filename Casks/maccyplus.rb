cask "maccyplus" do
  version "2.6.5"
  sha256 "d5d9d627d4ab430203513601fb708215c3b5f121e46ecc860e5294dd1d70344f"

  url "https://github.com/roypadina/maccyplus/releases/download/v#{version}/MaccyPlus.zip",
      verified: "github.com/roypadina/maccyplus/"
  name "MaccyPlus"
  desc "Clipboard manager with rule-based actions, plugins, and a headless config CLI"
  homepage "https://github.com/roypadina/maccyplus"

  depends_on macos: :sonoma

  app "MaccyPlus.app"

  zap trash: [
    "~/Library/Containers/com.royp.MaccyPlus",
    "~/Library/Preferences/com.royp.MaccyPlus.plist",
  ]

  caveats <<~EOS
    MaccyPlus is self-signed (not notarized), so on first launch macOS may block it.
    Right-click "MaccyPlus" in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine "/Applications/MaccyPlus.app"
  EOS
end
