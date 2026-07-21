cask "recall" do
  version "0.8.7"
  sha256 "580e20ddf34eef3d459dc399cf7bddc7635fd3ef2b59926a195f61f7fd9226c0"

  url "https://github.com/edihasaj/recall/releases/download/v0.8.7/Recall.app.zip"
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
