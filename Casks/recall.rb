cask "recall" do
  version "0.9.4"
  sha256 "4ffd8bdd30609e991f2d4a0f6270bc7ab4b5b7e149057dd675f196881c34bc03"

  url "https://github.com/edihasaj/recall/releases/download/v0.9.4/Recall.app.zip"
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
