cask "agentctl" do
  version "0.12.1"
  sha256 "3ba0a928513d11adbed6d43b2d3a22ac552ca4bc1a430872f2424adc1c01be17"

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
