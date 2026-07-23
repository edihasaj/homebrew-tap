class SlashX < Formula
  desc "Local X/Twitter CLI for posting, replying, and reading from the command line"
  homepage "https://github.com/edihasaj/slash-x#readme"
  url "https://github.com/edihasaj/slash-x/releases/download/v1.4.3/slash-x-1.4.3.tar.gz"
  sha256 "e6167e5459f4039d505df4674debc6a1af6c6833c14a726d5ecda40678803f1d"
  license "MIT"
  version "1.4.3"

  # Intentionally no `depends_on "node"`: the tarball bundles its own
  # node_modules, and the wrapper runs whatever node is already on PATH
  # (e.g. an nvm-managed runtime), so installing slash-x never pulls a
  # second Node onto the machine.

  def install
    libexec.install Dir["*"]
    (bin/"slash").write <<~EOS
      #!/bin/bash
      exec node "#{libexec}/dist/cli.js" "$@"
    EOS
    chmod 0755, bin/"slash"
  end

  test do
    assert_match "slash-x", shell_output("#{bin}/slash --version 2>&1", 0)
  end
end
