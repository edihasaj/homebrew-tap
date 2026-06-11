cask "recall" do
  version "0.8.2"
  sha256 "dcabf87cf7c5d4da612c14ba3fe4299647f6d03f5aeec6b034723ae0ff2f9e9f"

  url "https://github.com/edihasaj/recall/releases/download/v0.8.2/Recall.app.zip"
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
