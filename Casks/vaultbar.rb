cask "vaultbar" do
  version "0.1.1"
  sha256 "b76a7204118fca4a49a0b0b1c404450b8f6bda86769a175853c298047803fb6c"

  url "https://github.com/roypadina/VaultBar/releases/download/v#{version}/VaultBar.zip"
  name "VaultBar"
  desc "Menu bar app to lock and unlock encrypted disk-image vaults"
  homepage "https://github.com/roypadina/VaultBar"

  depends_on macos: :sonoma

  app "VaultBar.app"

  zap trash: "~/.config/vaultbar"

  caveats <<~EOS
    VaultBar is ad hoc signed (not notarized), so on first launch macOS may block it.
    Right-click VaultBar in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine /Applications/VaultBar.app
  EOS
end
