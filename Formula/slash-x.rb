class SlashX < Formula
  desc "Local X/Twitter CLI for posting, replying, and reading from the command line"
  homepage "https://github.com/edihasaj/slash-x#readme"
  url "https://github.com/edihasaj/slash-x/releases/download/v1.2.0/slash-x-1.2.0.tar.gz"
  sha256 "62dcdc972bf4b94403122c6d343991847c989f2ac2479548538a66d7740139a0"
  license "MIT"
  version "1.2.0"

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
