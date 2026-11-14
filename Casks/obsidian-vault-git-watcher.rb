cask "obsidian-vault-git-watcher" do
  version "0.5.0"
  sha256 "a59c7f8614d141d65a98e549d800b4a48d633b680be65f491ffd3391ccecebd5"

  url "https://github.com/roypadina/ObsidianVaultGitWatcher/releases/download/v#{version}/ObsidianVaultGitWatcher.zip"
  name "Obsidian Vault Git Watcher"
  desc "Menu bar app that reminds you to commit and push your Obsidian vaults"
  homepage "https://github.com/roypadina/ObsidianVaultGitWatcher"

  auto_updates true
  depends_on macos: :sonoma

  app "ObsidianVaultGitWatcher.app"

  zap launchctl: "com.roypadina.obsidian-vault-git-watcher",
      trash:     [
        "~/Library/Application Support/ObsidianVaultGitWatcher",
        "~/Library/LaunchAgents/com.roypadina.obsidian-vault-git-watcher.plist",
        "~/Library/Logs/obsidian-vault-git-watcher.log",
      ]

  caveats <<~EOS
    Obsidian Vault Git Watcher is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Open System Settings > Privacy & Security and click Open Anyway, or run once:
      xattr -dr com.apple.quarantine /Applications/ObsidianVaultGitWatcher.app
  EOS
end
