cask "chirpgo" do
  version "1.3.6"
  sha256 "8dcfba5ad50cb212c579aaf2bd674fbab1ce0a032a1e7d80c8c46ea096b24698"

  url "https://dl.chirpgo.app/ChirpGo-#{version}.dmg"
  name "Chirp Go"
  desc "Local, private speech-to-text: press a hotkey, speak, get your words pasted"
  homepage "https://chirpgo.app/"

  livecheck do
    url "https://dl.chirpgo.app/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # Ships its own Sparkle updater against dl.chirpgo.app/appcast.xml.
  auto_updates true
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Chirp Go.app"

  # The FluidAudio / WhisperKit model caches are deliberately left alone —
  # they are multi-gigabyte, shared with other FluidAudio apps, and survive a
  # reinstall on purpose.
  zap trash: [
    "~/Library/Application Support/ChirpGo",
    "~/Library/Caches/com.chirpapp.chirp",
    "~/Library/HTTPStorages/com.chirpapp.chirp",
    "~/Library/Preferences/com.chirpapp.chirp.plist",
  ]
end
