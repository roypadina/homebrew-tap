cask "maccyplus" do
  version "2.6.3"
  sha256 "ac31c75dbd72b383d3653d1bd9172d6777d6d75d77af4523e06fdc372a9d4ea7"

  url "https://github.com/roypadina/maccyplus/releases/download/v#{version}/MaccyPlus.zip",
      verified: "github.com/roypadina/maccyplus/"
  name "MaccyPlus"
  desc "Clipboard manager with rule-based actions and a headless config CLI"
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
