cask "recall" do
  version "0.9.10"
  sha256 "2402cae6f6f3e859d22b40f7b0e7696771dfb07736b3bdba43e42b563ab5c260"

  url "https://github.com/edihasaj/recall/releases/download/v0.9.10/Recall.app.zip"
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
