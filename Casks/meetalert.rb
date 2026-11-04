cask "meetalert" do
  version "1.9.1"
  sha256 "c639f20000fa8ce6e3e4f182ae0fb4d6135d66afaf94edf4b39883fd8960af47"

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
