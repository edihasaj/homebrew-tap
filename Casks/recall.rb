cask "recall" do
  version "0.8.17"
  sha256 "164ec92ddea88f2cdeae25a3ede15d1456e84e98e8119a08e039ee74ef6b0649"

  url "https://github.com/edihasaj/recall/releases/download/v0.8.17/Recall.app.zip"
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
