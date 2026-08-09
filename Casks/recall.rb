cask "recall" do
  version "0.9.9"
  sha256 "fb2fc01b32f89f66ab0ffc91bb5e0789fa710f11b23390fbc4863b4dab0adf7a"

  url "https://github.com/edihasaj/recall/releases/download/v0.9.9/Recall.app.zip"
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
