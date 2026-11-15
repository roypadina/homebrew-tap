cask "obsidian-vault-git-watcher" do
  version "0.5.1"
  sha256 "97bd834e81b966af1f56bd87a1937558c05f1e1341008b4eb14a25e8a83316a6"

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
