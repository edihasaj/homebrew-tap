cask "recall" do
  version "0.5.8"
  sha256 "041974ae840bc1eda593b2d9cf80573df55102d8f17094e906c8a8ed32486901"

  url "https://github.com/edihasaj/recall/releases/download/v0.5.8/Recall.app.zip"
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
