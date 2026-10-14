cask "chirpgo" do
  version "1.3.11"
  sha256 "014555f6ebd0afbe3e0975b0352ae11084eecd73c727291e14979081514dfe16"

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
