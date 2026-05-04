cask "recall" do
  version "0.5.0"
  sha256 "648dff448bc64b5c89ff3335cf707b03dd8eed58691bed3a4ab64850efc28d03"

  url "https://github.com/edihasaj/recall/releases/download/v0.5.0/Recall.app.zip"
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
