cask "recall" do
  version "0.8.4"
  sha256 "3bb381f63c0ed3d7ac70ba562c12ed4151dbb63d368153cec781e5f5983887bb"

  url "https://github.com/edihasaj/recall/releases/download/v0.8.4/Recall.app.zip"
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
