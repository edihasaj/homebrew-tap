cask "recall" do
  version "1.0.6"
  sha256 "ac55c1e78fa2a579c0c2070b06406110b541cf4c8597d5e9318a600ac48370ed"

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
