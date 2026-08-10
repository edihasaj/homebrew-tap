class Shotport < Formula
  desc "Token-cheap screenshot capture for coding agents"
  homepage "https://github.com/edihasaj/shotport"
  license "MIT"

  on_macos do
    depends_on "edihasaj/guiport/guiport"

    if Hardware::CPU.arm?
      url "https://github.com/edihasaj/shotport/releases/download/v0.3.4/shotport-darwin-arm64"
      sha256 "bc80a03251665aba7bf66be06e39ca056d58a7fdf32f7d05b8b168b2069b99e9"
    else
      url "https://github.com/edihasaj/shotport/releases/download/v0.3.4/shotport-darwin-x64"
      sha256 "3cfade01c1a4c49287d4b423ec1cc5116d6b0db4542b97b4bac3edddedfa6980"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/edihasaj/shotport/releases/download/v0.3.4/shotport-linux-arm64"
      sha256 "09dd0038efa237603b1555ae8d1d34a5f332b39a12612dc792aec98718a5edf6"
    else
      url "https://github.com/edihasaj/shotport/releases/download/v0.3.4/shotport-linux-x64"
      sha256 "5a51f9a65d2d33b797df7092126f8c9af46abb2de441c4ff38a2def31b94d281"
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
