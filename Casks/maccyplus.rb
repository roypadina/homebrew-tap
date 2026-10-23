cask "maccyplus" do
  version "2.8.2"
  sha256 "972c40679f232ee7d9171d0f7708486649a50c3cfbb966b422dcb59f213800a9"

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
