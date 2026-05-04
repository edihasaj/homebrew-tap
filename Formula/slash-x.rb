class SlashX < Formula
  desc "Local X/Twitter CLI for posting, replying, and reading from the command line"
  homepage "https://github.com/edihasaj/slash-x#readme"
  url "https://github.com/edihasaj/slash-x/releases/download/v0.9.2/slash-x-0.9.2.tar.gz"
  sha256 "fb69305144739518371f232cbfddba70faf4d79ce1bd5a6dbef9640146d83a26"
  license "MIT"
  version "0.9.2"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"slash").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/cli.js" "$@"
    EOS
    chmod 0755, bin/"slash"
  end

  test do
    assert_match "slash-x", shell_output("#{bin}/slash --version 2>&1", 0)
  end
end
