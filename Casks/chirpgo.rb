cask "chirpgo" do
  version "1.3.8"
  sha256 "652846d9876fc4d6cc62d7927eb65f4c6cfa7ad42104e178b9b8ed5ca0a162b7"

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
