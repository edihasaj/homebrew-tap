cask "recall" do
  version "0.5.7"
  sha256 "06928e6a7c45a7621959ad49a2865146484d665fc7b1043221eb14cd157da492"

  url "https://github.com/edihasaj/recall/releases/download/v0.5.7/Recall.app.zip"
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
