cask "recall" do
  version "2.0.1"
  sha256 "5a775c0f734a28d42bfa55ea336309c70256122c4755174f6792c24ac2c00505"

  url "https://github.com/edihasaj/recall/releases/download/v#{version}/Recall.app.zip"
  name "Recall"
  desc "Local repo-memory compiler for coding agents"
  homepage "https://recallmemory.dev/"

  depends_on macos: :sequoia

  app "Recall.app"
  binary "#{appdir}/Recall.app/Contents/Resources/Runtime/bin/recall",
         target: "recall"

  zap trash: [
    "~/.recall",
    "~/Library/LaunchAgents/com.recall.daemon.plist",
    "~/Library/Preferences/com.edihasaj.recall.plist",
  ]
end
