cask "vaultbar" do
  version "0.2.2"
  sha256 "ee30b82a06943220fda2c71476f18382d4ab7045288fc089ed376952b05dfd85"

  url "https://github.com/roypadina/VaultBar/releases/download/v#{version}/VaultBar.zip"
  name "VaultBar"
  desc "Menu bar app to lock and unlock encrypted disk-image vaults"
  homepage "https://github.com/roypadina/VaultBar"

  depends_on macos: :sonoma

  app "VaultBar.app"
  binary "#{appdir}/VaultBar.app/Contents/MacOS/VaultBar", target: "vaultbar"

  zap launchctl: "com.padina.vaultbar.login",
      trash:     [
        "~/.config/vaultbar",
        "~/Library/LaunchAgents/com.padina.vaultbar.login.plist",
      ]

  caveats <<~EOS
    VaultBar is ad hoc signed (not notarized), so on first launch macOS may block it.
    Right-click VaultBar in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine /Applications/VaultBar.app
  EOS
end
