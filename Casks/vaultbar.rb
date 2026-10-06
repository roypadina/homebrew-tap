cask "vaultbar" do
  version "0.2.0"
  sha256 "5bde575d06afefe791fdb7389be5e55522a6b69f207ad5790a1767d6b401a148"

  url "https://github.com/roypadina/VaultBar/releases/download/v#{version}/VaultBar.zip"
  name "VaultBar"
  desc "Menu bar app to lock and unlock encrypted disk-image vaults"
  homepage "https://github.com/roypadina/VaultBar"

  depends_on macos: :sonoma

  app "VaultBar.app"
  binary "#{appdir}/VaultBar.app/Contents/MacOS/VaultBar", target: "vaultbar"

  zap trash: "~/.config/vaultbar"

  caveats <<~EOS
    VaultBar is ad hoc signed (not notarized), so on first launch macOS may block it.
    Right-click VaultBar in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine /Applications/VaultBar.app
  EOS
end
