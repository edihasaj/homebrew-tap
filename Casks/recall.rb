cask "recall" do
  version "0.5.1"
  sha256 "6dd616e5c44cb0e14235feaba33923f9a970cd9b03537f7212e0d047d70cbf7d"

  url "https://github.com/edihasaj/recall/releases/download/v0.5.1/Recall.app.zip"
  name "Recall"
  desc "Local repo-memory compiler for coding agents"
  homepage "https://edihasaj.github.io/recall/"

  depends_on macos: ">= :sequoia"

  app "Recall.app"

  zap trash: [
    "~/.recall",
    "~/Library/LaunchAgents/com.recall.daemon.plist",
    "~/Library/Preferences/com.edihasaj.recall.plist",
  ]
end
