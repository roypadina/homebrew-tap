cask "agentctl" do
  version "0.12.0"
  sha256 "61e5ab5e9658b9e92c9132f49df24102900b8a23c5a5737589f7d49a25cb67ce"

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
