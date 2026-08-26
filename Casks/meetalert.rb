cask "meetalert" do
  version "1.3.1"
  sha256 "72d72ad499ef20eee9f42fe5e912904b7e5bf3cd3076bd6ab1fa08a26ab74350"

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
