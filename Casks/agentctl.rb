cask "agentctl" do
  version "0.14.0"
  sha256 "0c1c0e1f8f7ad4b869883c681e057c9e3778eab9ec21f23649a617506a54c059"

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
