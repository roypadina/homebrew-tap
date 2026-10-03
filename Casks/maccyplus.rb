cask "maccyplus" do
  version "2.7.1"
  sha256 "0e4decd4dd275c476c3cc1cc0cbeff03dbbe8b21bbc3b2323575700ab2f4500b"

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
