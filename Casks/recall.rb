cask "recall" do
  version "0.9.6"
  sha256 "3403f066833d4e6225efdb8b315ea5c3ddac1c22c610fee6123bc7ee51078a7c"

  url "https://github.com/edihasaj/recall/releases/download/v0.9.6/Recall.app.zip"
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
