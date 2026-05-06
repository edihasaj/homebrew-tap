cask "recall" do
  version "0.5.6"
  sha256 "080b256fd3a78420c40cd3911be0cde4ae08ce62cb12095a51d19247adf39304"

  url "https://github.com/edihasaj/recall/releases/download/v0.5.6/Recall.app.zip"
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
