cask "obsidian-vault-git-watcher" do
  version "0.2.0"
  sha256 "31fe2ef417fc25da5f6b9514dae100b8e2addcf7a6a42bee7cf290804fcbd350"

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
    Right-click ObsidianVaultGitWatcher in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine /Applications/ObsidianVaultGitWatcher.app
  EOS
end
