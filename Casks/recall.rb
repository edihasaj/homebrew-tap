cask "recall" do
  version "1.0.4"
  sha256 "0c9118cf3d017a0d1a42ec91fdaa727a9b838518f0c6b512eb6eee083c3c4ecd"

  url "https://github.com/edihasaj/recall/releases/download/v#{version}/Recall.app.zip"
  name "Recall"
  desc "Local repo-memory compiler for coding agents"
  homepage "https://recallmemory.dev/"

  depends_on macos: :sequoia

  app "Recall.app"
  binary "#{appdir}/Recall.app/Contents/Resources/Runtime/bin/recall",
         target: "recall"

  postflight do
    # The bundle is ad-hoc signed (no Developer ID), so Gatekeeper would
    # otherwise refuse to launch it and macOS may relocate it. Strip the
    # quarantine xattr that Homebrew sets after copying the app into place.
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
