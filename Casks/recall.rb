cask "recall" do
  version "0.6.6"
  sha256 "e70eef0a8d637f5f532ce7676f92e445e6a08b734cd3d7084f9ccd1194be1b0f"

  url "https://github.com/edihasaj/recall/releases/download/v0.6.6/Recall.app.zip"
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
