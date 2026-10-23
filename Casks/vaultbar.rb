cask "vaultbar" do
  version "0.2.3"
  sha256 "966b574fc14dc60437e4460f0f55da320675122a331c155ec303e5bccc3da823"

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
    Open System Settings > Privacy & Security and click Open Anyway (right-click > Open no longer works on macOS 15+), or run once:
      xattr -dr com.apple.quarantine /Applications/VaultBar.app
  EOS
end
