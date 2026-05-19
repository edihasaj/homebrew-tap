cask "recall" do
  version "0.7.0"
  sha256 "2baa44c29e34d56ae5c51dfd8e60ab4b5bbd0b8e4e8ff1dbaafbebc6385bcc83"

  url "https://github.com/edihasaj/recall/releases/download/v0.7.0/Recall.app.zip"
  name "Recall"
  desc "Local repo-memory compiler for coding agents"
  homepage "https://recallmemory.dev/"

  depends_on macos: ">= :sequoia"

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
