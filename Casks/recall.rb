cask "recall" do
  version "0.8.5"
  sha256 "6f29f27244a42551ce38452fbfddb3d07ab7160b4f0a21e8af681f598b26549e"

  url "https://github.com/edihasaj/recall/releases/download/v0.8.5/Recall.app.zip"
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
