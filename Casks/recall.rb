cask "recall" do
  version "0.9.0"
  sha256 "c6216e28d9d381b7a178fb9bd774e64216af0bf1c4734fb57851cc6c5dc93613"

  url "https://github.com/edihasaj/recall/releases/download/v0.9.0/Recall.app.zip"
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
