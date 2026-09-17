cask "meetalert" do
  version "1.5.0"
  sha256 "e26b1e24bb075a0f43c4a633af4d1ce2e4c08060e8dab53026fe98e23839f00f"

  url "https://github.com/roypadina/MeetAlert/releases/download/v#{version}/MeetAlert.zip"
  name "MeetAlert"
  desc "Unmissable meeting alerts — desktop popup, ntfy phone push, urgent escalation"
  homepage "https://github.com/roypadina/MeetAlert"

  depends_on macos: :sonoma

  app "MeetAlert.app"

  zap trash: [
    "~/.config/meetalert",
    "~/.config/meetalert-test",
  ]

  caveats <<~EOS
    MeetAlert is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Right-click MeetAlert in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine "/Applications/MeetAlert.app"

    On first launch, grant Calendar access when prompted. Phone notifications
    need a one-time ntfy setup: https://github.com/roypadina/MeetAlert#ntfy-setup
  EOS
end
