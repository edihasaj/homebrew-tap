cask "recall" do
  version "1.4.17"
  sha256 "deb9b64de7e6d0cb560620232c34ec43ecbd35c6e2a5ce5f95ddd9a3d3eb6e65"

  url "https://github.com/edihasaj/recall/releases/download/v#{version}/Recall.app.zip"
  name "Recall"
  desc "Local repo-memory compiler for coding agents"
  homepage "https://recallmemory.dev/"

  depends_on macos: :sequoia

  app "Recall.app"
  binary "#{appdir}/Recall.app/Contents/Resources/Runtime/bin/recall",
         target: "recall"

  postflight_steps do
    # The bundle is ad-hoc signed (no Developer ID), so Gatekeeper would
    # otherwise refuse to launch it and macOS may relocate it. Strip the
    # quarantine xattr that Homebrew sets after copying the app into place.
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Recall.app"]
  end

  zap trash: [
    "~/.recall",
    "~/Library/LaunchAgents/com.recall.daemon.plist",
    "~/Library/Preferences/com.edihasaj.recall.plist",
  ]
end
