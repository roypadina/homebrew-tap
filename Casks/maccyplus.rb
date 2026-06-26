cask "maccyplus" do
  version "2.6.6"
  sha256 "66b8ebda2d7ad5d37f7b02ddd9155f024f6b1a93c4089e083a5b01462786c50d"

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
