cask "maccyplus" do
  version "2.10.0"
  sha256 "c918bf81b4eff53658bb7c48f0ee2895b572875444d705b10b2595d1134755a2"

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
    On macOS 15+ open it once, then click "Open Anyway" in System Settings > Privacy & Security, or run once:
      xattr -dr com.apple.quarantine "/Applications/MaccyPlus.app"
  EOS
end
