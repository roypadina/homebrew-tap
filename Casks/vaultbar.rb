cask "vaultbar" do
  version "0.1.0"
  sha256 "20b6fb517854f9c4f6d3044f6c0e1eca2f8ded16dd8bee0c0d95c770146fef6b"

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
