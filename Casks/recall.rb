cask "recall" do
  version "0.8.8"
  sha256 "3c061c0ee02dd9c8bdd3c54763c8cf404a4206c2510000618a17a3058b2b683c"

  url "https://github.com/edihasaj/recall/releases/download/v0.8.8/Recall.app.zip"
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
