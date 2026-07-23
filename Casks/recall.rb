cask "recall" do
  version "0.8.12"
  sha256 "d576d364fff2dbbc312fc580f8ec00a18918bdbb35bcaf9e47ab24787c1fa602"

  url "https://github.com/edihasaj/recall/releases/download/v0.8.12/Recall.app.zip"
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
