cask "recall" do
  version "0.6.2"
  sha256 "9b14f591f9e7d3377446bbeac80b9ca21eb88d27604a83e0093d51ff7ac859a0"

  url "https://github.com/edihasaj/recall/releases/download/v0.6.2/Recall.app.zip"
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
