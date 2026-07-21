cask "recall" do
  version "0.8.10"
  sha256 "7a3e50144ff4aa4219e5caa2df1da7aa02eb5a8ff7c913821a1930feb9491d20"

  url "https://github.com/edihasaj/recall/releases/download/v0.8.10/Recall.app.zip"
  name "Recall"
  desc "Local repo-memory compiler for coding agents"
  homepage "https://recallmemory.dev/"

  depends_on macos: :sequoia

  app "Recall.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Recall.app"],
                   sudo: false
  end

  zap trash: [
    "~/.recall",
    "~/Library/LaunchAgents/com.recall.daemon.plist",
    "~/Library/Preferences/com.edihasaj.recall.plist",
  ]
end
