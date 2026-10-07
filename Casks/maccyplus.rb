cask "maccyplus" do
  version "2.8.0"
  sha256 "c6ea532cd3b4ab780de49e531a4a3ebe7581c527776a41572d1187655c992b19"

  url "https://github.com/roypadina/maccyplus/releases/download/v#{version}/MaccyPlus.zip"
  name "MaccyPlus"
  desc "Clipboard manager with rule-based actions, plugins, and an agent-friendly CLI"
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
