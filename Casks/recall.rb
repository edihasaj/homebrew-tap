cask "recall" do
  version "0.5.5"
  sha256 "06f2b089202f0e788ca2d451eab075e2eef180348504c38f7bb8adda2b74396e"

  url "https://github.com/edihasaj/recall/releases/download/v0.5.5/Recall.app.zip"
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
