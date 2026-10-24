cask "obsidian-vault-git-watcher" do
  version "0.2.4"
  sha256 "b73e64af2688d5423507cc4116caffd2ed92d7f9594a4107e76c45ef7ed8499b"

  url "https://github.com/roypadina/ObsidianVaultGitWatcher/releases/download/v#{version}/ObsidianVaultGitWatcher.zip"
  name "Obsidian Vault Git Watcher"
  desc "Menu bar app that reminds you to commit and push your Obsidian vaults"
  homepage "https://github.com/roypadina/ObsidianVaultGitWatcher"

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
