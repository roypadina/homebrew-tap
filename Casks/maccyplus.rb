cask "maccyplus" do
  version "2.7.2"
  sha256 "c09c8ec48dee2db96b1218736e1257419c663cbafff95556e5be7b807fc2ac99"

  url "https://github.com/roypadina/maccyplus/releases/download/v#{version}/MaccyPlus.zip"
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
