cask "recall" do
  version "0.9.8"
  sha256 "38c57fd89c6900e3cfd31dd86dee91567ad791b86b0f1e8ecbcfe191b8140900"

  url "https://github.com/edihasaj/recall/releases/download/v0.9.8/Recall.app.zip"
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
