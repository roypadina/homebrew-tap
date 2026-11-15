cask "meetalert" do
  version "1.10.1"
  sha256 "9e10860b7fbc8a3b281b797cbbceedae9e8752cba23fc53cdfe667d3884aa5da"

  url "https://github.com/roypadina/MeetAlert/releases/download/v#{version}/MeetAlert.zip"
  name "MeetAlert"
  desc "Unmissable meeting alerts — desktop popup, ntfy phone push, urgent escalation"
  homepage "https://github.com/roypadina/MeetAlert"

  auto_updates true
  depends_on macos: :sonoma

  app "MeetAlert.app"

  zap trash: [
    "~/.config/meetalert",
    "~/.config/meetalert-test",
  ]

  caveats <<~EOS
    MeetAlert is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Open System Settings > Privacy & Security and click Open Anyway, or run once:
      xattr -dr com.apple.quarantine "/Applications/MeetAlert.app"

    On first launch, grant Calendar access when prompted. Phone notifications
    need a one-time ntfy setup: https://github.com/roypadina/MeetAlert#ntfy-setup
  EOS
end
