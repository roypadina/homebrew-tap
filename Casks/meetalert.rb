cask "meetalert" do
  version "1.2.0"
  sha256 "b7cff02fcfacb805b2ae7e7a94b0e2f90929718f15fefcd0c07917762d9605b7"

  url "https://github.com/roypadina/MeetAlert/releases/download/v#{version}/MeetAlert.zip",
      verified: "github.com/roypadina/MeetAlert/"
  name "MeetAlert"
  desc "Unmissable meeting alerts — desktop popup, ntfy phone push, urgent escalation"
  homepage "https://github.com/roypadina/MeetAlert"

  depends_on macos: :sonoma

  app "MeetAlert.app"

  zap trash: "~/.config/meetalert"

  caveats <<~EOS
    MeetAlert is ad-hoc signed (not notarized), so on first launch macOS may block it.
    Right-click MeetAlert in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine "/Applications/MeetAlert.app"

    On first launch, grant Calendar access when prompted. Phone notifications
    need a one-time ntfy setup: https://github.com/roypadina/MeetAlert#ntfy-setup
  EOS
end
