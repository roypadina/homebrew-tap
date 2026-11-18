cask "agentctl" do
  version "0.14.1"
  sha256 "d14c6fbf7b4ac4c416222dd07a358ed90012b8afb8633140cecb295aee012406"

  url "https://github.com/roypadina/agentctl/releases/download/v#{version}/agentctl.zip"
  name "Agentctl"
  desc "Terminal menu to start or resume Claude/Codex coding-agent sessions"
  homepage "https://github.com/roypadina/agentctl"

  depends_on formula: "node"

  binary "agentctl/bin/agentctl"

  zap trash: [
    "~/.config/agentctl",
    "~/Library/Preferences/com.roypadina.agentctl.plist",
  ]
end
