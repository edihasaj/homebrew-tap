class SlashX < Formula
  desc "Local X/Twitter CLI for posting, replying, and reading from the command line"
  homepage "https://github.com/edihasaj/slash-x#readme"
  url "https://github.com/edihasaj/slash-x/releases/download/v1.4.2/slash-x-1.4.2.tar.gz"
  sha256 "73a213012622a4c8a1c7fcb0bf493e51d354b9ce6917904a864dca58a216321e"
  license "MIT"
  version "1.4.2"

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
