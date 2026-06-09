cask "klyp" do
  version "0.1.13"
  sha256 "89fb567d59e0ca9217c8b085e1a5d0c9cbaddf908e0f04f0056e70f941b9049c"

  url "https://github.com/edihasaj/klyp/releases/download/v#{version}/Klyp.app.zip"
  name "Klyp"
  desc "Lightweight clipboard history manager"
  homepage "https://github.com/edihasaj/klyp"

  depends_on macos: :sonoma

  app "Klyp.app"

  zap trash: [
    "~/Library/Application Support/Klyp",
    "~/Library/Caches/com.edihasaj.klyp",
    "~/Library/Preferences/com.edihasaj.klyp.plist",
  ]
end
