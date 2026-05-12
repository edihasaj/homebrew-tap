cask "klyp" do
  version "0.1.8"
  sha256 "8d62726548bb5dcb7e55c047f854506e082d45d76d14ff032d0b1fd77e9d4d84"

  url "https://github.com/edihasaj/klyp/releases/download/v#{version}/Klyp.app.zip"
  name "Klyp"
  desc "Lightweight clipboard history manager for macOS"
  homepage "https://github.com/edihasaj/klyp"

  depends_on macos: ">= :sonoma"

  app "Klyp.app"

  zap trash: [
    "~/Library/Application Support/Klyp",
    "~/Library/Preferences/com.edihasaj.klyp.plist",
    "~/Library/Caches/com.edihasaj.klyp",
  ]
end
