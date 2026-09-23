cask "recall" do
  version "1.4.13"
  sha256 "c882a76e165e127fd2bcb5b0922b98f673ddacb88c3149e28ac5c6cba0208af6"

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
