cask "recall" do
  version "0.5.4"
  sha256 "c668b352457ca58bc2565ab15dcd22e3ceafe4ea7a863eed2f39c18a83195e60"

  url "https://github.com/edihasaj/recall/releases/download/v0.5.4/Recall.app.zip"
  name "Recall"
  desc "Local repo-memory compiler for coding agents"
  homepage "https://recallmemory.dev/"

  depends_on macos: ">= :sequoia"

  app "Recall.app"

  zap trash: [
    "~/.recall",
    "~/Library/LaunchAgents/com.recall.daemon.plist",
    "~/Library/Preferences/com.edihasaj.recall.plist",
  ]
end
