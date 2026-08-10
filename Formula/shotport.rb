class Shotport < Formula
  desc "Token-cheap screenshot capture for coding agents"
  homepage "https://github.com/edihasaj/shotport"
  version "0.3.3"
  license "MIT"

  on_macos do
    depends_on "edihasaj/guiport/guiport"

    if Hardware::CPU.arm?
      url "https://github.com/edihasaj/shotport/releases/download/v0.3.3/shotport-darwin-arm64"
      sha256 "1fde634ab52c07f10ef2bb1941e2a3d13b5c6eaf4bc9912412519ba31f4f360d"
    else
      url "https://github.com/edihasaj/shotport/releases/download/v0.3.3/shotport-darwin-x64"
      sha256 "e5968b1fb4414c27e50ba71c137e97b0c2ebe9534cf170aad78398da840dd10e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/edihasaj/shotport/releases/download/v0.3.3/shotport-linux-arm64"
      sha256 "9370a9a61a239ca2c80fcf8fcefa237fa6db508a322123afd840174a1eedc769"
    else
      url "https://github.com/edihasaj/shotport/releases/download/v0.3.3/shotport-linux-x64"
      sha256 "8f89526594ba89a4369704c2786977872efe074d18816f088815964a248a722a"
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
