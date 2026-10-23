cask "agentctl" do
  version "0.11.2"
  sha256 "196219a98583ae8428273349e75d9095b9fc22443ecb9f2e0ee75dd4b538f8bb"

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
