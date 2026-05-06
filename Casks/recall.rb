cask "recall" do
  version "0.5.3"
  sha256 "ee0091925d25a27767c025c61e028119813092444a33c7175fcb23b17d37b255"

  url "https://github.com/edihasaj/recall/releases/download/v0.5.3/Recall.app.zip"
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
