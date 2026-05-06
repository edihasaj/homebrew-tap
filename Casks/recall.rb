cask "recall" do
  version "0.5.2"
  sha256 "a32220497f96bb519b5862ce2619cc30c86b2923d2faa5bc4ad61d1d7bf7dc09"

  url "https://github.com/edihasaj/recall/releases/download/v0.5.2/Recall.app.zip"
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
