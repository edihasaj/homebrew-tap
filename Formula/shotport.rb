class Shotport < Formula
  desc "Token-cheap screenshot capture for coding agents"
  homepage "https://github.com/edihasaj/shotport"
  license "MIT"

  on_macos do
    depends_on "edihasaj/guiport/guiport"

    if Hardware::CPU.arm?
      url "https://github.com/edihasaj/shotport/releases/download/v0.3.5/shotport-darwin-arm64"
      sha256 "4a8e6b5e0ac0e9238e87b2e2b875cec3c1d9519d07dc3631f45b082ef0211203"
    else
      url "https://github.com/edihasaj/shotport/releases/download/v0.3.5/shotport-darwin-x64"
      sha256 "e9b0630905065e6d0c5e79a51036d40cdb858cc721695d77db6c2c1c1252b5b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/edihasaj/shotport/releases/download/v0.3.5/shotport-linux-arm64"
      sha256 "b5867445cf11f0b67d5e58efac16d2b3c92bc6133d71a4bbe86fadc65340f981"
    else
      url "https://github.com/edihasaj/shotport/releases/download/v0.3.5/shotport-linux-x64"
      sha256 "42f7acd796e180070ea0eebd64978e68b26f964d38bc2aca5798ac75c3bd1d2c"
    end
  end

  def install
    binary = Dir["shotport-*"].first
    bin.install binary => "shotport"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shotport --version")
  end
end
