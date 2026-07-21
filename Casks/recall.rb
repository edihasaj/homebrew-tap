cask "recall" do
  version "0.8.11"
  sha256 "93a0e3261d18c4eb8764def62c4049b6a1b9e1402fd2f935b4d7dd7f205d4347"

  url "https://github.com/edihasaj/recall/releases/download/v0.8.11/Recall.app.zip"
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
