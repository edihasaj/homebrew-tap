cask "recall" do
  version "0.8.0"
  sha256 "fe567876a1cdc7bc200e031df4f3a44ce78f6586bc094a0438b0b02f12ec2a2b"

  url "https://github.com/edihasaj/recall/releases/download/v0.8.0/Recall.app.zip"
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
