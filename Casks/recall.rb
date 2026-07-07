cask "recall" do
  version "0.8.3"
  sha256 "bb1eccb63eb1c17617467e2f487e01c210d655c342e1f2d7e1fa26029f4ea82b"

  url "https://github.com/edihasaj/recall/releases/download/v0.8.3/Recall.app.zip"
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
